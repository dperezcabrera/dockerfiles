# Jasypt Decrypt Cli

## Info:

* [Documentation](http://www.jasypt.org/cli.html) 


## Build:

```
docker build -t dperezcabrera/jasypt-decrypt-cli .
```


## Usage:

```
docker run --rm \
	-e MASTER_KEY="supersecret" \
	-e ENCRYPTED_PASSWORD="4Egov2lOLJJXK+nEMg9ozg==" \
	dperezcabrera/jasypt-decrypt-cli
```

### Environment var

* ALGORITHM: The default value is *PBEWithMD5AndDES*.
* MASTER_KEY: This is the master key to decrypt encrypted password.
* ENCRYPTED_PASSWORD: This is the encrypted password to be decrypted.


## Output:

```

----ENVIRONMENT-----------------

Runtime: IcedTea OpenJDK 64-Bit Server VM 25.212-b04 



----ARGUMENTS-------------------

algorithm: PBEWithMD5AndDES
input: 4Egov2lOLJJXK+nEMg9ozg==
password: supersecret



----OUTPUT----------------------

secret


```

