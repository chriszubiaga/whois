# WHOIS Lookup Script

This is a Ruby script designed to perform WHOIS lookups for a list of domain names provided in an input file. The script uses the `whois` gem to fetch WHOIS information for each domain name and saves the results to individual text files in a directory named `whois_results`. If there's an error during the lookup, an error message is saved to a separate text file in the same directory.

## Requirements

- [**Ruby**](https://www.ruby-lang.org/en/): The programming language used to write this script.
- [**whois**](https://github.com/weppos/whois): A Ruby gem used for WHOIS lookups.
- **fileutils**: A Ruby gem used for file and directory operations.

## Installation

### 1. Install Ruby

If you don't have Ruby installed on your system, you can download and install it from the [official Ruby website](https://www.ruby-lang.org/en/downloads/).

### 2. Install the whois gem

After installing Ruby, open your terminal and run the following command to install the `whois` gem:

```bash
gem install whois
```

### 3. Install the fileutils gem

Run the following command to install the `fileutils` gem:

```bash
gem install fileutils
```

## Usage

```bash
ruby script.rb input_file_path
```

- `input_file_path`: Path to the input file containing a list of domain names.

## Input File Format

The input file should contain a list of domain names, one per line. Each domain name should be stripped of any leading or trailing spaces and should not end with a trailing slash (`/`).

Example:

```
example.com
google.com
github.com
```

## Output

The script will create a directory named `whois_results` if it doesn't already exist. For each domain name in the input file:

- If the WHOIS lookup is successful, the result will be saved in a text file named `{domain}_whois_result.txt` within the `whois_results` directory.
- If the WHOIS server is not found for a domain or any other error occurs during the lookup, an error message will be saved in a text file named `{domain}_whois_error.txt` within the `whois_results` directory.

## Error Handling

The script handles two types of errors:

1. **Whois::ServerNotFound**: Occurs when the WHOIS server for a domain is not found.
2. **StandardError**: Generic error handling for any other exceptions.

## Example

To run the script with an input file named `domains.txt`, execute the following command:

```bash
ruby script.rb domains.txt
```

This will process each domain name in `domains.txt`, perform a WHOIS lookup, and save the results or errors in the `whois_results` directory.

**Note:** Make sure to replace `domains.txt` with the actual path to your input file.
