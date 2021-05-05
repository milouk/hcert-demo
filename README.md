# To generate a key run the following commands

- `openssl ecparam -name prime256v1 -genkey -noout -out private-key.pem`

- `openssl ec -in private-key.pem -pubout -out public-key.pem`

Then we need to rename our private key to .key so the HCERT program can read it (This has been patched in this fork so it is not necessary)

`mv private-key.pem private.key`

# To generate an eHealth QR code run the following

First we must exec in the container by typing:

`docker exec -it green_qr_dev bash`

Then we must spawn a poetry shell by running:

`poetry shell`

Finally, we run the following:

`python hcert/cli.py sign --key private.key --input test.json --qrcode qr.png`


# Verification

If we want to verify our result we need to re-run the sign but this time we have
to export the signed binary. We can do this by typing:

`python hcert/cli.py sign --key private.pem --input test.json --output mybinary`

Now to verify it we can run:

`python hcert/cli.py verify --key public.key --input mybinary --output verified.json`
