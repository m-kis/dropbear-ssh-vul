# OpenSSH MAX_UNAUTH_CLIENTS Exploit Script

This script exploits the 'MAX_UNAUTH_CLIENTS' vulnerability in Dropbear or OpenSSH servers, causing a denial of service (DoS) condition. It is intended for authorized penetration testing purposes only.

## Usage

1. Install the required Perl modules:
$ cpan IO::Socket::INET Getopt::Long threads

arduino
Copy code

2. Run the script with the following command-line options:
$ perl exploit.pl --target <target_domain> --port <target_port> --duration <attack_duration>

typescript
Copy code
Replace `<target_domain>`, `<target_port>`, and `<attack_duration>` with the appropriate values.

3. By default, the script will use multithreading with 10 threads to increase the number of simultaneous connections. You can adjust the number of threads by modifying the `$threads_count` variable in the script.

## Requirements

- Perl 5.10 or higher
- IO::Socket::INET module
- Getopt::Long module
- threads module

## Disclaimer

The usage of this script is subject to applicable laws and regulations. Ensure that you have obtained proper authorization before conducting any penetration testing activities. The script is provided "as is" without any warranties or guarantees of any kind. M-KIS shall not be held liable for any misuse or damages caused by the script.

## Contributing

Pull requests and suggestions are welcome! If you discover any issues or have ideas for improvements, please open an issue or submit a pull request.

## License

This script is licensed under the [MIT License](LICENSE).
