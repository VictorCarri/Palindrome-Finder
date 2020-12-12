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
		my $str = $_[0]; # For ease of use
		#print "isPalindrome: checking ", $str, "\n";
		my $strLen = length $str; # To determine how to split the string
		#print "The string's length is " . $strLen . "\n";
		
		if (($strLen % 2) == 0) # Even length
		{
			#print "The string's length is an even natural number.\n";
			# An even number is of the form 2k.
			# Thus, the left half will be the left k characters.
			# And the right half will consist of the right k characters.
			# The word is a palindrome if the left half equals the reverse of the right half
			my $k = $strLen / 2; # Guaranteed to be an integer since $strLen is an even number
			#print "k = ", $k, "\n";
			my $leftHalf = substr $str, 0, $k;
			#print "The left half of the string is \"", $leftHalf, "\"\n";
			my $rightHalf = substr $str, $k;
			#print "The right half of the string is \"", $rightHalf, "\"\n";
			return $leftHalf eq (reverse $rightHalf);
		}

		else # Odd length
		{
			#print "The string's length is an odd natural number.\n";
			# An odd number is of the form 2k+1.
			# In a palindrome of odd length, there is one character between the 2 strings that are the reverse of each other.
			# This leaves 2k characters that form the palindrome - k characters on the left, & k characters on the right.
			# Thus, the left half of the palindrome is the slice str[0..k-1].
			# The center character is at position k.
			# And the right half of the palindrome is reverse(str[k+1..end])
			my $k = ($strLen - 1) / 2; # $strLen - 1 is guaranteed to be an even number, since $strLen is odd. Thus, $k will be a natural number, since the length is a natural number
			#print "k = ", $k, "\n";
			my $leftHalf = substr $str, 0, $k; # The left half of the string
			#print "The left half of the string is \"", $leftHalf, "\"\n";
			my $rightHalf = substr $str, ($k+1); # The right half of the string
			#print "The right half of the string is \"", $rightHalf, "\"\n";
			return $leftHalf eq (reverse $rightHalf); # A string of odd length is a palindrome if the right half is the reverse of the left half
		}
	}
}

# Main script
#print Dumper \@ARGV;
my $argc = @ARGV; # Check # of arguments
#print $argc . "\n";

if ($argc != 1)
{
	print "Usage: $0 /path/to/dictionary/text/file\n";
	exit 1;
}

else
{
	#print "Dictionary file: $ARGV[0]\n";
	open (my $fh, '<:encoding(UTF-8)', $ARGV[0])
		or die "Couldn't open file $ARGV[0]";
	
	while (my $row = <$fh>)
	{
		chomp $row;
		
		if (isPalindrome $row)
		{
			print $row, "\n";
		}
	}

	close $fh;
}
