# Prompt for the password using Zenity and store it in a variable
password=$(zenity --password --title="GAdmin-Rsync")

# Check if the password is correct
echo "$password" | sudo -S true 2>/dev/null
if [ $? -eq 0 ]; then
    # Launch the application with elevated privileges using sudo, if the password is correct
    echo "$password" | sudo -S gadmin-rsync
else
    # Display an error message using Zenity, if the password is incorrect
    zenity --error --title="GAdmin-Rsync" --text="Incorrect password. Please try again."
fi
