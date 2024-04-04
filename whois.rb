require 'whois'
require 'fileutils'

unless ARGV.length == 1
  puts "Usage: ruby script.rb input_file_path"
  exit 1
end

input_file_path = ARGV[0]

unless File.exist?(input_file_path)
  puts "Error: Input file not found."
  exit 1
end

Dir.mkdir("whois_results") unless Dir.exist?("whois_results")

File.open(input_file_path, "r") do |input_file|
  input_file.each_line do |line|
    input = line.strip.chomp('/')
    puts "Processing input: #{input}"
    begin
      whois = Whois::Client.new
      result = whois.lookup(input)
      output_filename = File.join("whois_results", "#{input}_whois_result.txt")
      puts "Writing result to: #{output_filename}"
      File.open(output_filename, "w") do |output_file|
        output_file.puts(result)
      end
    rescue Whois::ServerNotFound => e
      error_message = "Error: WHOIS server not found for #{input}: #{e.message}"
      error_filename = File.join("whois_results", "#{input}_whois_error.txt")
      puts error_message
      puts "Writing error to: #{error_filename}"
      File.open(error_filename, "w") do |error_file|
        error_file.puts(error_message)
      end
    rescue StandardError => e
      error_message = "Error: #{e.message}"
      error_filename = File.join("whois_results", "#{input}_whois_error.txt")
      puts error_message
      puts "Writing error to: #{error_filename}"
      File.open(error_filename, "w") do |error_file|
        error_file.puts(error_message)
      end
    end
  end
end
