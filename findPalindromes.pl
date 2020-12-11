#!/usr/bin/perl
use strict;
use warnings;
use Data::Dumper qw(Dumper);
use diagnostics;

# @desc Determines whether a given string is a palindrome
# @return True if the word is a palindrome, false otherwise
sub isPalindrome {
	my $nArgs = scalar(@_); # Get # of arguments

	if ($nArgs != 1) # Bad call
	{
		die "isPalindrome: exactly 1 argument required!";
	}

	else
	{
		my $strLen = length $_[0]; # To determine how to split the string
		print "The string's length is " . $strLen . "\n";
		
		if (($strLen % 2) == 0) # Even length
		{
			print "The string's length is an even natural number.\n";
		}

		else # Odd length
		{
			print "The string's length is an odd natural number.\n";
		}
	}
}

# Main script
print Dumper \@ARGV;
my $argc = @ARGV; # Check # of arguments
print $argc . "\n";

if ($argc != 1)
{
	print "Usage: perl $0 /path/to/dictionary/text/file\n";
	exit 1;
}

else
{
	print "Dictionary file: $ARGV[0]\n";
	open (my $fh, '<:encoding(UTF-8)', $ARGV[0])
		or die "Couldn't open file $ARGV[0]";
	
	while (my $row = <$fh>)
	{
		chomp $row;
		isPalindrome $row;
	}

	close $fh;
}
