
#!/bin/bash


# Add a crlnumber file to the intermediate CA directory tree. crlnumber is used to
# keep track of certificate revocation lists.
echo 1000 > ./ca/intermediate/crlnumber

