#Install the lastpass-cli
#https://github.com/lastpass/lastpass-cli
#brew update
#brew install lastpass-cli
#yum -y install lastpass-cli

LASTPASS_USER=$1
#echo "LP User is $LASTPASS_USER"
LASTPASS_MASTER_PASSWORD=$2
#echo "LP password is $LASTPASS_MASTER_PASSWORD"
CUSTOMER_PRIMARY_EMAIL=$3
#echo "Customer Primary emails is $CUSTOMER_PRIMARY_EMAIL"
CUST_ID=$(cat /dev/urandom |LC_ALL=C tr -dc 'a-zA-Z0-9' | fold -w 10 | head -n 1)
#echo "Customer ID is $CUST_ID"
URL=$4
#this is for the case where username and primary email need to be set different
CUSTOMER_USER_NAME=$5
export LPASS_DISABLE_PINENTRY=1
echo $LASTPASS_MASTER_PASSWORD|lpass login $LASTPASS_USER
GENERATED_PASSWORD="vArmour123"
flag="true"

generate_password_urandom(){
	# coreutils on mac os is required for shuf command., It won't be required on Linux
	#brew install coreutils
	printf -v small "%s" {a..z}
	printf -v large "%s" {A..Z}
	printf -v digit "%s" {0..9}
	special='@#$%^&*+=<>?'

	# Debug loop can comment out later
	for s in small large digit special; do
	   str=${!s}
	done

	get4() {
	   for s in small large digit special; do
	      echo "${!s}" | sed 's/./&\n/g' | grep . | shuf | head -1
	   done| tr -d '\n'
	}
	passw=$(echo "$(get4)$(cat /dev/urandom | LC_ALL=C tr -dc 'a-zA-Z0-9$%&%' | fold -w 8 | head -n 1)" |
	   sed 's/./&\n/g' | grep . | shuf | tr -d '\n')
	GENERATED_PASSWORD=${passw}
}

generate_password_urandom

export AC_New_User=$CUSTOMER_USER_NAME
export AC_New_Pass=$GENERATED_PASSWORD


{
cat <<EOF 
URL:$URL
Username:$CUSTOMER_USER_NAME
Password:$GENERATED_PASSWORD
EOF
}| lpass add --non-interactive --sync=now $CUSTOMER_PRIMARY_EMAIL

#Create a shared folder named Shared-$CUSTOMER_USER_NAME
lpass share create $CUSTOMER_USER_NAME_$CUST_ID

#adding a wait time of 30 seconds
echo "Wait for 60 seconds"

sleep 60

#lpass sync

lpass_id=$(lpass show $CUST|grep ^$CUST|cut -f2 -d ":"|tr -d ']')

echo "Lastpass ID to move to shared folder is $lpass_id"

lpass mv $lpass_id Shared-$CUST_ID

sleep 30
echo "Wait for 30 seconds before sending an email invite"
#add a user to the share with hidden=false, this sends an automated email to the end user with $CUSTOMER_PRIMARY_EMAIL
lpass share useradd --hidden=false Shared-$CUST_ID $CUSTOMER_PRIMARY_EMAIL


echo "Record created for the user with email $CUSTOMER_PRIMARY_EMAIL and username $CUSTOMER_USER_NAME in the shared folder named Shared-$CUST_ID"




