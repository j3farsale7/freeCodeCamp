#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=salon -t --no-align -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"
echo -e "Welcome to My Salon, how can I help you?\n"

# Main menu function
MAIN_MENU() {
  # Display services
  $PSQL "SELECT service_id, name FROM services ORDER BY service_id" | while IFS="|" read SERVICE_ID SERVICE_NAME
  do
    echo "$SERVICE_ID) $SERVICE_NAME"
  done
  
  read SERVICE_ID_SELECTED
  SERVICE_LOOKUP
}

# Validate service ID and proceed
SERVICE_LOOKUP() {
  # Check if input is a number
  if [[ $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]; then
    SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
    
    # Check if service exists
    if [[ -n $SERVICE_NAME ]]; then
      PHONE_LOOKUP
      return
    fi
  fi
  
  # Invalid service handling
  echo -e "\nI could not find that service. What would you like today?"
  MAIN_MENU
}

# Handle phone number lookup
PHONE_LOOKUP() {
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  
  # Validate phone format (numbers/spaces/dashes, max 12 chars)
  if [[ ! $CUSTOMER_PHONE =~ ^[0-9\ \-]{1,12}$ ]]; then
    echo "Invalid phone format. Use only numbers, spaces, or dashes (max 12 characters)."
    PHONE_LOOKUP
    return
  fi
  
  # Check if customer exists
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  
  if [[ -z $CUSTOMER_ID ]]; then
    NEW_CUSTOMER
  else
    EXISTING_CUSTOMER
  fi
}

# Handle new customer registration
NEW_CUSTOMER() {
  echo -e "\nI don't have a record for that phone number, what's your name?"
  read CUSTOMER_NAME
  
  # Insert new customer
  $PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')"
  
  # Get new customer ID
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  
  SCHEDULE_APPOINTMENT
}

# Handle existing customer
EXISTING_CUSTOMER() {
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
  SCHEDULE_APPOINTMENT
}

# Schedule appointment time
SCHEDULE_APPOINTMENT() {
  echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
  read SERVICE_TIME
  
  # Create appointment
  $PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')"
  
  # Confirmation
  echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME.\n"
}

# Start the application
MAIN_MENU
