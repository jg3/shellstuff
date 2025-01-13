#!/bin/bash

# Securely Transport SSH Keys Script

# Exit immediately if any command fails
set -e

# Variables
SSH_DIR="$HOME/.ssh"
TAR_FILE="ssh_stuff.tgz"
ENCRYPTED_FILE="ssh_stuff.tgz.age"
PEM_FILE="SSH_Key_for_shellstuff.pem"
PUBLIC_KEY="$SSH_DIR/SSH_Key_for_shellstuff.pub"
PRIVATE_KEY="$SSH_DIR/SSH_Key_for_shellstuff.key"

if [ ! -d "$SSH_DIR" ]; then
  echo "Error: SSH_DIR (${SSH_DIR}) not a directory"
  exit 1
fi

if [ ! -f "$PUBLIC_KEY" ]; then
  echo "Error: PUBLIC_KEY (${PUBLIC_KEY}) does not exist"
  exit 1
fi

if [ ! -f "$PRIVATE_KEY" ]; then
    echo "Warning: Private Key does not exist at ${PRIVATE_KEY}."
    echo " Please ensure you have it securely stored elsewhere."
    PRIVATE_KEY="YOUR_PRIVATE_KEY"
fi

echo "Creating archive of the ~/.ssh directory..."
echo " ----------------------------------------- "
tar -cvzHf "$TAR_FILE" "$SSH_DIR"
echo " ----------------------------------------- "

# Encrypt the Tar File Using age and the public ssh key
echo "Encrypting with the specified public key..."
age --encrypt --recipients-file $PUBLIC_KEY --output $ENCRYPTED_FILE $TAR_FILE

ls -Fhlat $ENCRYPTED_FILE

# Clean up temporary file
rm $TAR_FILE

# Transfer the Encrypted File (Manual Step)
echo "Encrypted file created: $ENCRYPTED_FILE"
echo "Please transfer this file securely (e.g., using scp or USB)."

# Instructions for Decryption on Target Machine
cat <<EOF

To decrypt and extract the SSH keys on the target machine, follow these steps:

1. Place the encrypted file ($ENCRYPTED_FILE) on the target machine.
2. Run the following commands on the target machine:
   age --decrypt --identity $PRIVATE_KEY --output $TAR_FILE $ENCRYPTED_FILE
   tar -xzf $TAR_FILE -C ~/.ssh/

EOF

echo "Process completed successfully!"
