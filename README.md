# 42Cursus-Inception

## Requirements

This project was developed and tested on Debian Linux.

To run this project, you'll need the following tools installed on your system:

- Docker Engine: [Docker Installation Guide](https://docs.docker.com/engine/install/)
- make

## Usage

### Clone repo:
```shell
git clone https://github.com/dspereira/42Cursus-Inception.git inception && cd inception
```

### Setting Up Environment Variables:
Before running the project, create a .env file in the root directory and populate it with the required environment variables, following the .env.template as a guide.
```shell
touch .env
```

### Build:
```shell
make
```

### Testing the Website
To ensure everything is working correctly, you can test by opening the provided link with your chosen domain. Since you are using OpenSSL, your certificate is self-signed, which may trigger a privacy and security warning in your browser. In this case, you will need to bypass this message and proceed to access the website.

https://example.com


## Useful Resources
[Useful commands for Docker](https://github.com/dspereira/42Cursus-Inception/blob/main/docs/useful-commands.md).

## License
This project is licensed under the [MIT License](https://github.com/dspereira/42Cursus-Inception/blob/main/LICENSE).

## Contact
If you have any questions or comments about this project, please feel free to contact me at diogo.s.pereira@outlook.pt.
