# Jasypt Encrypt Cli

## Info:

* [Documentation](http://www.jasypt.org/cli.html) 


## Build:

```
docker build -t dperezcabrera/jasypt-encrypt-cli .
```


## Usage:

```
docker run --rm \
	-e MASTER_KEY="supersecret" \
	-e INPUT_PASSWORD="secret" \
	dperezcabrera/jasypt-encrypt-cli
```

### Environment var

* ALGORITHM: The default value is *PBEWithMD5AndDES*.
* MASTER_KEY: This is the master key to encrypt input password.
* INPUT_PASSWORD: This is the input password to be encrypted.


## Output:

```

----ENVIRONMENT-----------------

Runtime: IcedTea OpenJDK 64-Bit Server VM 25.212-b04 



----ARGUMENTS-------------------

algorithm: PBEWithMD5AndDES
input: secret
password: supersecret



----OUTPUT----------------------

4Egov2lOLJJXK+nEMg9ozg==


```




