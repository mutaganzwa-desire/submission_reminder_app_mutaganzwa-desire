#!/bin/bash
#Ask the github username
while true;do
	read -p 'Please enter your name: ' username
	if [[ -z "$username" ]];then
		echo "Please enter your name!"
	else
		break
	fi
done
#Create the main directory
main_dir=submission_reminder_$username
mkdir -p $main_dir
#Create subdirectories
mkdir -p $main_dir/app $main_dir/modules $main_dir/assets $main_dir/config
#Create reminder.sh script
cat << 'EOF' > $main_dir/app/reminder.sh
#!/bin/bash

# Source environment variables and helper functions
source ./config/config.env
source ./modules/functions.sh

# Path to the submissions file
submissions_file="./assets/submissions.txt"

# Print remaining time and run the reminder function
echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions $submissions_file

EOF
cat << 'EOF' > $main_dir/modules/functions.sh
#!/bin/bash

# Function to read submissions file and output students who have not submitted
function check_submissions {
    local submissions_file=$1
    echo "Checking submissions in $submissions_file"

    # Skip the header and iterate through the lines
    while IFS=, read -r student assignment status; do
        # Remove leading and trailing whitespace
        student=$(echo "$student" | xargs)
        assignment=$(echo "$assignment" | xargs)
        status=$(echo "$status" | xargs)

        # Check if assignment matches and status is 'not submitted'
        if [[ "$status" == "not submitted" ]]; then
            echo "Reminder: $student has not submitted the $assignment assignment!"
        elif [[ $status" == ""submitted" ]]; then
            echo "Reminder: $student has submitted the $assignment assignment!"
        fi
    done < <(tail -n +2 "$submissions_file") # Skip the header
}

EOF
cat << 'EOF' > $main_dir/assets/submissions.txt
student, assignment, submission status
Anissa, Shell Navigation, submitted
Alice, Shell Navigation, submitted
Bob, Shell Navigation, not submitted
Charlie, Shell Navigation, submitted
Chiagoziem, Shell Navigation, submitted
Chinemerkem, Shell Navigation, not submitted
David, Shell Navigation, not submitted
Divine, Shell Navigation, not submitted
Eve, Shell Navigation, not submitted
Frank, Shell Navigation, submitted
Grace, Shell Navigation, not submitted
Heidi, Shell Navigation, submitted
Ivan, Shell Navigation, not submitted
Judy, Shell Navigation, submitted
EOF
cat << 'EOF' > $main_dir/config/config.env

# This is the config file
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
EOF
cat << 'EOF' > $main_dir/startup.sh
#!/bin/bash
# startup.sh - Starts the submission reminder application

echo "Starting submission reminder application..."
./$main_dir/app/reminder.sh
EOF
#Make all required files executable
chmod +x $main_dir/startup.sh $main_dir/app/reminder.sh $main_dir/modules/functions.sh
#success message
echo "  .Environment successfully created."
echo "   -Change the directory to submission_reminder_$username"
echo "   -Run startup.sh script using the ./startup.sh command to view students' submitted and/or pending submissions."
echo "  .Note: All scripts already have executble permissions."
