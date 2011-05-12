####################################################################
#
#    This file was generated using Parse::Yapp version 1.05.
#
#        Don't edit this file, use source file instead.
#
#             ANY CHANGE MADE HERE WILL BE LOST !
#
####################################################################
package drawparser;
use vars qw ( @ISA );
use strict;

@ISA= qw ( Parse::Yapp::Driver );
use Parse::Yapp::Driver;



sub new {
        my($class)=shift;
        ref($class)
    and $class=ref($class);

    my($self)=$class->SUPER::new( yyversion => '1.05',
                                  yystates =>
[
	{#State 0
		ACTIONS => {
			'DVAR' => 2
		},
		GOTOS => {
			'Cgis' => 1,
			'AuxTitle' => 3,
			'Title' => 4
		}
	},
	{#State 1
		ACTIONS => {
			'' => 5
		}
	},
	{#State 2
		DEFAULT => -6
	},
	{#State 3
		ACTIONS => {
			'DVAR' => 6
		},
		DEFAULT => -5
	},
	{#State 4
		ACTIONS => {
			";" => 7
		}
	},
	{#State 5
		DEFAULT => 0
	},
	{#State 6
		DEFAULT => -7
	},
	{#State 7
		ACTIONS => {
			'DVAR' => 9
		},
		GOTOS => {
			'Flag' => 8,
			'Flags' => 10
		}
	},
	{#State 8
		ACTIONS => {
			";" => 11
		}
	},
	{#State 9
		ACTIONS => {
			"=" => 12
		}
	},
	{#State 10
		ACTIONS => {
			'DVAR' => 14
		},
		GOTOS => {
			'Flag' => 13,
			'Perl' => 16,
			'Module' => 15,
			'Graph' => 17,
			'Type' => 18,
			'OrgNode' => 19,
			'Functions' => 20,
			'Vars' => 21,
			'Object' => 22,
			'FuncBlock' => 25,
			'Var' => 24,
			'Edge' => 23
		}
	},
	{#State 11
		DEFAULT => -8
	},
	{#State 12
		ACTIONS => {
			"\/" => 26,
			'DVAR' => 28,
			"\\" => 32
		},
		GOTOS => {
			'Values' => 29,
			'Windows' => 27,
			'Unix' => 30,
			'Url' => 31,
			'Email' => 33
		}
	},
	{#State 13
		ACTIONS => {
			";" => 34
		}
	},
	{#State 14
		ACTIONS => {
			'DVAR' => -71,
			"->" => -69,
			"=" => 12
		},
		DEFAULT => -33
	},
	{#State 15
		ACTIONS => {
			"{" => 35
		}
	},
	{#State 16
		DEFAULT => -27
	},
	{#State 17
		ACTIONS => {
			'DVAR' => 36
		},
		DEFAULT => -1,
		GOTOS => {
			'OrgNode' => 19,
			'Edge' => 37
		}
	},
	{#State 18
		ACTIONS => {
			'DVAR' => 38
		},
		GOTOS => {
			'Name' => 39
		}
	},
	{#State 19
		ACTIONS => {
			"->" => 40
		}
	},
	{#State 20
		ACTIONS => {
			'DVAR' => 41
		},
		GOTOS => {
			'OrgNode' => 19,
			'Module' => 15,
			'Graph' => 42,
			'FuncBlock' => 43,
			'Edge' => 23
		}
	},
	{#State 21
		ACTIONS => {
			'DVAR' => 44
		},
		GOTOS => {
			'Perl' => 16,
			'Module' => 15,
			'Graph' => 45,
			'Type' => 18,
			'OrgNode' => 19,
			'Functions' => 46,
			'Object' => 22,
			'Var' => 47,
			'Edge' => 23,
			'FuncBlock' => 25
		}
	},
	{#State 22
		DEFAULT => -26
	},
	{#State 23
		DEFAULT => -43
	},
	{#State 24
		ACTIONS => {
			";" => 48
		}
	},
	{#State 25
		DEFAULT => -30
	},
	{#State 26
		ACTIONS => {
			'DVAR' => 49
		}
	},
	{#State 27
		ACTIONS => {
			"\\" => 50
		},
		DEFAULT => -16
	},
	{#State 28
		ACTIONS => {
			"\@" => 51
		},
		DEFAULT => -13
	},
	{#State 29
		ACTIONS => {
			'DVAR' => 52
		},
		DEFAULT => -11
	},
	{#State 30
		ACTIONS => {
			"\/" => 53
		},
		DEFAULT => -17
	},
	{#State 31
		DEFAULT => -10
	},
	{#State 32
		ACTIONS => {
			'DVAR' => 54
		}
	},
	{#State 33
		DEFAULT => -12
	},
	{#State 34
		DEFAULT => -9
	},
	{#State 35
		ACTIONS => {
			"(" => 57,
			'DVAR' => 55
		},
		GOTOS => {
			'Prototype' => 56,
			'Type' => 58,
			'FuncList' => 59
		}
	},
	{#State 36
		DEFAULT => -69
	},
	{#State 37
		DEFAULT => -44
	},
	{#State 38
		ACTIONS => {
			":" => 60,
			'DVAR' => 61
		},
		DEFAULT => -72,
		GOTOS => {
			'Name' => 62
		}
	},
	{#State 39
		ACTIONS => {
			"=" => 63
		},
		DEFAULT => -24
	},
	{#State 40
		ACTIONS => {
			'DVAR' => 64
		},
		GOTOS => {
			'DstNode' => 65
		}
	},
	{#State 41
		ACTIONS => {
			"->" => -69
		},
		DEFAULT => -33
	},
	{#State 42
		ACTIONS => {
			'DVAR' => 36
		},
		DEFAULT => -3,
		GOTOS => {
			'OrgNode' => 19,
			'Edge' => 37
		}
	},
	{#State 43
		DEFAULT => -31
	},
	{#State 44
		ACTIONS => {
			'DVAR' => -71,
			"->" => -69
		},
		DEFAULT => -33
	},
	{#State 45
		ACTIONS => {
			'DVAR' => 36
		},
		DEFAULT => -2,
		GOTOS => {
			'OrgNode' => 19,
			'Edge' => 37
		}
	},
	{#State 46
		ACTIONS => {
			'DVAR' => 41
		},
		GOTOS => {
			'OrgNode' => 19,
			'Module' => 15,
			'Graph' => 66,
			'FuncBlock' => 43,
			'Edge' => 23
		}
	},
	{#State 47
		ACTIONS => {
			";" => 67
		}
	},
	{#State 48
		DEFAULT => -22
	},
	{#State 49
		DEFAULT => -20
	},
	{#State 50
		ACTIONS => {
			'DVAR' => 68
		}
	},
	{#State 51
		ACTIONS => {
			'DVAR' => 69
		}
	},
	{#State 52
		DEFAULT => -14
	},
	{#State 53
		ACTIONS => {
			'DVAR' => 70
		}
	},
	{#State 54
		DEFAULT => -18
	},
	{#State 55
		DEFAULT => -71
	},
	{#State 56
		ACTIONS => {
			";" => 71
		}
	},
	{#State 57
		ACTIONS => {
			'DVAR' => 55
		},
		GOTOS => {
			'Type' => 72,
			'Args' => 73
		}
	},
	{#State 58
		ACTIONS => {
			"(" => 74,
			'DVAR' => 61
		},
		GOTOS => {
			'Name' => 75
		}
	},
	{#State 59
		ACTIONS => {
			"}" => 76,
			"(" => 57,
			'DVAR' => 55
		},
		GOTOS => {
			'Prototype' => 77,
			'Type' => 58
		}
	},
	{#State 60
		ACTIONS => {
			":" => 78
		}
	},
	{#State 61
		DEFAULT => -72
	},
	{#State 62
		DEFAULT => -28
	},
	{#State 63
		ACTIONS => {
			'DVAR' => 79
		}
	},
	{#State 64
		DEFAULT => -70
	},
	{#State 65
		ACTIONS => {
			"=>" => 80
		},
		DEFAULT => -46
	},
	{#State 66
		ACTIONS => {
			'DVAR' => 36
		},
		DEFAULT => -4,
		GOTOS => {
			'OrgNode' => 19,
			'Edge' => 37
		}
	},
	{#State 67
		DEFAULT => -23
	},
	{#State 68
		DEFAULT => -19
	},
	{#State 69
		DEFAULT => -15
	},
	{#State 70
		DEFAULT => -21
	},
	{#State 71
		DEFAULT => -34
	},
	{#State 72
		DEFAULT => -41
	},
	{#State 73
		ACTIONS => {
			"," => 81,
			")" => 82
		}
	},
	{#State 74
		ACTIONS => {
			'DVAR' => 55
		},
		GOTOS => {
			'Type' => 72,
			'Args' => 83
		}
	},
	{#State 75
		ACTIONS => {
			"(" => 85
		},
		GOTOS => {
			'TypeArg' => 84
		}
	},
	{#State 76
		DEFAULT => -32
	},
	{#State 77
		ACTIONS => {
			";" => 86
		}
	},
	{#State 78
		ACTIONS => {
			'DVAR' => 87
		}
	},
	{#State 79
		DEFAULT => -25
	},
	{#State 80
		ACTIONS => {
			"(" => 92,
			'DVAR' => 61
		},
		GOTOS => {
			'Parameters' => 91,
			'SpecialType' => 88,
			'FunctionCall' => 93,
			'Parameter' => 94,
			'Name' => 95,
			'PerlMethod' => 89,
			'MethodCall' => 90
		}
	},
	{#State 81
		ACTIONS => {
			'DVAR' => 55
		},
		GOTOS => {
			'Type' => 96
		}
	},
	{#State 82
		ACTIONS => {
			'DVAR' => 61
		},
		GOTOS => {
			'Name' => 97
		}
	},
	{#State 83
		ACTIONS => {
			"," => 81,
			")" => 98
		}
	},
	{#State 84
		DEFAULT => -36
	},
	{#State 85
		ACTIONS => {
			'DVAR' => 55,
			")" => 100
		},
		GOTOS => {
			'Type' => 72,
			'Args' => 99
		}
	},
	{#State 86
		DEFAULT => -35
	},
	{#State 87
		ACTIONS => {
			'DVAR' => 61
		},
		GOTOS => {
			'Name' => 101
		}
	},
	{#State 88
		DEFAULT => -50
	},
	{#State 89
		DEFAULT => -62
	},
	{#State 90
		DEFAULT => -52
	},
	{#State 91
		ACTIONS => {
			";" => 102
		},
		DEFAULT => -45
	},
	{#State 92
		ACTIONS => {
			'DVAR' => 61
		},
		GOTOS => {
			'FuncArgs' => 103,
			'Name' => 104
		}
	},
	{#State 93
		DEFAULT => -51
	},
	{#State 94
		DEFAULT => -47
	},
	{#State 95
		ACTIONS => {
			":" => 105,
			"(" => 108,
			"{" => 106,
			"[" => 109
		},
		DEFAULT => -49,
		GOTOS => {
			'NameArg' => 107
		}
	},
	{#State 96
		DEFAULT => -42
	},
	{#State 97
		ACTIONS => {
			"(" => 85
		},
		GOTOS => {
			'TypeArg' => 110
		}
	},
	{#State 98
		ACTIONS => {
			'DVAR' => 61
		},
		GOTOS => {
			'Name' => 111
		}
	},
	{#State 99
		ACTIONS => {
			"," => 81,
			")" => 112
		}
	},
	{#State 100
		DEFAULT => -39
	},
	{#State 101
		DEFAULT => -29
	},
	{#State 102
		ACTIONS => {
			"(" => 92,
			'DVAR' => 61
		},
		GOTOS => {
			'SpecialType' => 88,
			'FunctionCall' => 93,
			'Parameter' => 113,
			'Name' => 95,
			'PerlMethod' => 89,
			'MethodCall' => 90
		}
	},
	{#State 103
		ACTIONS => {
			"," => 114,
			")" => 115
		}
	},
	{#State 104
		DEFAULT => -58
	},
	{#State 105
		ACTIONS => {
			'DVAR' => 116
		}
	},
	{#State 106
		ACTIONS => {
			'DVAR' => 117
		}
	},
	{#State 107
		DEFAULT => -57
	},
	{#State 108
		ACTIONS => {
			'DVAR' => 61,
			")" => 119
		},
		GOTOS => {
			'FuncArgs' => 118,
			'Name' => 104
		}
	},
	{#State 109
		ACTIONS => {
			'DVAR' => 61
		},
		GOTOS => {
			'FuncArgs' => 120,
			'Name' => 104
		}
	},
	{#State 110
		DEFAULT => -37
	},
	{#State 111
		ACTIONS => {
			"(" => 85
		},
		GOTOS => {
			'TypeArg' => 121
		}
	},
	{#State 112
		DEFAULT => -40
	},
	{#State 113
		DEFAULT => -48
	},
	{#State 114
		ACTIONS => {
			'DVAR' => 61
		},
		GOTOS => {
			'Name' => 122
		}
	},
	{#State 115
		ACTIONS => {
			'DVAR' => 61
		},
		GOTOS => {
			'Name' => 123
		}
	},
	{#State 116
		ACTIONS => {
			":" => 124
		},
		DEFAULT => -53
	},
	{#State 117
		ACTIONS => {
			"}" => 126,
			":" => 125,
			"(" => 108,
			"->" => 127
		},
		GOTOS => {
			'NameArg' => 128
		}
	},
	{#State 118
		ACTIONS => {
			"," => 114,
			")" => 129
		}
	},
	{#State 119
		DEFAULT => -60
	},
	{#State 120
		ACTIONS => {
			"," => 114,
			"]" => 130
		}
	},
	{#State 121
		DEFAULT => -38
	},
	{#State 122
		DEFAULT => -59
	},
	{#State 123
		ACTIONS => {
			"(" => 108
		},
		GOTOS => {
			'NameArg' => 131
		}
	},
	{#State 124
		ACTIONS => {
			'DVAR' => 132
		}
	},
	{#State 125
		ACTIONS => {
			":" => 133
		}
	},
	{#State 126
		DEFAULT => -63
	},
	{#State 127
		ACTIONS => {
			'DVAR' => 134
		}
	},
	{#State 128
		ACTIONS => {
			"}" => 135
		}
	},
	{#State 129
		DEFAULT => -61
	},
	{#State 130
		DEFAULT => -55
	},
	{#State 131
		DEFAULT => -56
	},
	{#State 132
		DEFAULT => -54
	},
	{#State 133
		ACTIONS => {
			'DVAR' => 136
		}
	},
	{#State 134
		ACTIONS => {
			"}" => 137,
			"(" => 108
		},
		GOTOS => {
			'NameArg' => 138
		}
	},
	{#State 135
		DEFAULT => -64
	},
	{#State 136
		ACTIONS => {
			"->" => 139
		}
	},
	{#State 137
		DEFAULT => -65
	},
	{#State 138
		ACTIONS => {
			"}" => 140
		}
	},
	{#State 139
		ACTIONS => {
			'DVAR' => 141
		}
	},
	{#State 140
		DEFAULT => -67
	},
	{#State 141
		ACTIONS => {
			"}" => 142,
			"(" => 108
		},
		GOTOS => {
			'NameArg' => 143
		}
	},
	{#State 142
		DEFAULT => -66
	},
	{#State 143
		ACTIONS => {
			"}" => 144
		}
	},
	{#State 144
		DEFAULT => -68
	}
],
                                  yyrules  =>
[
	[#Rule 0
		 '$start', 2, undef
	],
	[#Rule 1
		 'Cgis', 4,
sub
#line 5 "drawparser.yp"
{
				my $list;
				$list->[0] = { Title => $_[1] };
				$list->[1] = { Flags => $_[3] };
				$list->[2] = { Vars => [] };
				$list->[3] = { Functions => [] };
				$list->[4] = { Graph => $_[4] };
				return $list
	   }
	],
	[#Rule 2
		 'Cgis', 5,
sub
#line 14 "drawparser.yp"
{ 
				my $list;
				$list->[0] = { Title => $_[1] };
				$list->[1] = { Flags => $_[3] };
				$list->[2] = { Vars => $_[4] };
				$list->[3] = { Functions => [] };
				$list->[4] = { Graph => $_[5] };
				return $list
	   }
	],
	[#Rule 3
		 'Cgis', 5,
sub
#line 23 "drawparser.yp"
{
	   			my $list;
				$list->[0] = { Title => $_[1] };
				$list->[1] = { Flags => $_[3] };
				$list->[2] = { Vars => [] };
				$list->[3] = { Functions => $_[4] };
				$list->[4] = { Graph => $_[5] };
				return $list
	   }
	],
	[#Rule 4
		 'Cgis', 6,
sub
#line 32 "drawparser.yp"
{
				my $list;
				$list->[0] = { Title => $_[1] };
				$list->[1] = { Flags => $_[3] };
				$list->[2] = { Vars => $_[4] };
				$list->[3] = { Functions => $_[5] };
				$list->[4] = { Graph => $_[6] };
				return $list
	   }
	],
	[#Rule 5
		 'Title', 1,
sub
#line 45 "drawparser.yp"
{ return [ { title => $_[1] } ] }
	],
	[#Rule 6
		 'AuxTitle', 1,
sub
#line 48 "drawparser.yp"
{ return $_[1] }
	],
	[#Rule 7
		 'AuxTitle', 2,
sub
#line 49 "drawparser.yp"
{ return ($_[1].' '.$_[2]) }
	],
	[#Rule 8
		 'Flags', 2,
sub
#line 54 "drawparser.yp"
{ return $_[1] }
	],
	[#Rule 9
		 'Flags', 3,
sub
#line 55 "drawparser.yp"
{
                push @{$_[1]},@{$_[2]};
                return $_[1]
        }
	],
	[#Rule 10
		 'Flag', 3,
sub
#line 61 "drawparser.yp"
{ return [ { $_[1] => $_[3] } ] }
	],
	[#Rule 11
		 'Flag', 3,
sub
#line 62 "drawparser.yp"
{ return [ { $_[1] => $_[3] } ] }
	],
	[#Rule 12
		 'Flag', 3,
sub
#line 63 "drawparser.yp"
{ return [ { $_[1] => $_[3] } ] }
	],
	[#Rule 13
		 'Values', 1,
sub
#line 66 "drawparser.yp"
{ return $_[1] }
	],
	[#Rule 14
		 'Values', 2,
sub
#line 67 "drawparser.yp"
{ return $_[1].' '.$_[2] }
	],
	[#Rule 15
		 'Email', 3,
sub
#line 70 "drawparser.yp"
{ return $_[1].$_[2].$_[3] }
	],
	[#Rule 16
		 'Url', 1,
sub
#line 73 "drawparser.yp"
{ return $_[1] }
	],
	[#Rule 17
		 'Url', 1,
sub
#line 74 "drawparser.yp"
{ return $_[1] }
	],
	[#Rule 18
		 'Windows', 2,
sub
#line 77 "drawparser.yp"
{ return $_[1].$_[2] }
	],
	[#Rule 19
		 'Windows', 3,
sub
#line 78 "drawparser.yp"
{ return $_[1].$_[2].$_[3] }
	],
	[#Rule 20
		 'Unix', 2,
sub
#line 81 "drawparser.yp"
{ return $_[1].$_[2] }
	],
	[#Rule 21
		 'Unix', 3,
sub
#line 82 "drawparser.yp"
{ return $_[1].$_[2].$_[3] }
	],
	[#Rule 22
		 'Vars', 2,
sub
#line 87 "drawparser.yp"
{ return $_[1] }
	],
	[#Rule 23
		 'Vars', 3,
sub
#line 88 "drawparser.yp"
{
				push @{$_[1]},@{$_[2]};
				return $_[1]
	   }
	],
	[#Rule 24
		 'Var', 2,
sub
#line 94 "drawparser.yp"
{ return [ { $_[2] => [ { type => $_[1], value => undef, init => '0' } ] } ] }
	],
	[#Rule 25
		 'Var', 4,
sub
#line 95 "drawparser.yp"
{ return [ { $_[2] => [ { type => $_[1], value => $_[4], init => '1' } ] } ] }
	],
	[#Rule 26
		 'Var', 1,
sub
#line 96 "drawparser.yp"
{ return $_[1] }
	],
	[#Rule 27
		 'Object', 1,
sub
#line 99 "drawparser.yp"
{ return $_[1] }
	],
	[#Rule 28
		 'Perl', 3,
sub
#line 102 "drawparser.yp"
{ return [ { $_[3] => [ { type => 'OBJECT', lang => $_[1], value => undef, module => $_[2] } ] } ] }
	],
	[#Rule 29
		 'Perl', 6,
sub
#line 103 "drawparser.yp"
{ return [ { $_[6] => [ { type => 'OBJECT', lang => $_[1], value => undef, module => $_[2].$_[3].$_[4].$_[5] } ] } ] }
	],
	[#Rule 30
		 'Functions', 1,
sub
#line 108 "drawparser.yp"
{ return $_[1] }
	],
	[#Rule 31
		 'Functions', 2,
sub
#line 109 "drawparser.yp"
{
		    			push @{$_[1]},@{$_[2]};
		  				return $_[1]
		    }
	],
	[#Rule 32
		 'FuncBlock', 4,
sub
#line 115 "drawparser.yp"
{
					foreach(@{$_[3]}) {
						my @key = keys %{$_};
						$_->{$key[0]}->[0] = { module => $_[1] }
					}
					return $_[3];
			}
	],
	[#Rule 33
		 'Module', 1,
sub
#line 124 "drawparser.yp"
{ return $_[1] }
	],
	[#Rule 34
		 'FuncList', 2,
sub
#line 127 "drawparser.yp"
{ return [ $_[1] ] }
	],
	[#Rule 35
		 'FuncList', 3,
sub
#line 128 "drawparser.yp"
{
		   				push @{$_[1]},$_[2];
						return $_[1]
		   }
	],
	[#Rule 36
		 'Prototype', 3,
sub
#line 134 "drawparser.yp"
{
				my $list;
				$list->[0] = { module => undef };
				$list->[1] = { return => uc($_[1]) };
				$list->[2] = { args => $_[3] };
				return { $_[2] => $list }
			}
	],
	[#Rule 37
		 'Prototype', 5,
sub
#line 141 "drawparser.yp"
{
				my $list;
				$list->[0] = { module => undef };
				$list->[1] = { return => [ { COMPOSED => $_[2] } ] };
				$list->[2] = { args => $_[5] };
				return { $_[4] => $list }
			}
	],
	[#Rule 38
		 'Prototype', 6,
sub
#line 148 "drawparser.yp"
{
	   			my $list;
		   		$list->[0] = { module => undef };
		   		$list->[1] = { return => [ { uc($_[1]) => $_[3] } ] };
		   		$list->[2] = { args => $_[6] };
		   		return { $_[5] => $list }
		    }
	],
	[#Rule 39
		 'TypeArg', 2,
sub
#line 164 "drawparser.yp"
{ return 'VOID' }
	],
	[#Rule 40
		 'TypeArg', 3,
sub
#line 165 "drawparser.yp"
{ return $_[2] }
	],
	[#Rule 41
		 'Args', 1,
sub
#line 168 "drawparser.yp"
{ return [ $_[1] ] }
	],
	[#Rule 42
		 'Args', 3,
sub
#line 169 "drawparser.yp"
{
	    		push @{$_[1]},$_[3];
				return $_[1]
	   }
	],
	[#Rule 43
		 'Graph', 1,
sub
#line 177 "drawparser.yp"
{ return $_[1] }
	],
	[#Rule 44
		 'Graph', 2,
sub
#line 178 "drawparser.yp"
{
	    		push @{$_[1]},@{$_[2]};
				return $_[1]
		}
	],
	[#Rule 45
		 'Edge', 5,
sub
#line 184 "drawparser.yp"
{ return [ { $_[1] => [ { $_[3] => $_[5] } ] } ] }
	],
	[#Rule 46
		 'Edge', 3,
sub
#line 185 "drawparser.yp"
{ return [ { $_[1] => [ { $_[3] => [] } ] } ] }
	],
	[#Rule 47
		 'Parameters', 1,
sub
#line 188 "drawparser.yp"
{ return $_[1] }
	],
	[#Rule 48
		 'Parameters', 3,
sub
#line 189 "drawparser.yp"
{
					push @{$_[1]},@{$_[3]};
					return $_[1]
			 }
	],
	[#Rule 49
		 'Parameter', 1,
sub
#line 195 "drawparser.yp"
{ return [ { $_[1] => [ { type => 'VAR', transit => '0', required => '1' } ] } ] }
	],
	[#Rule 50
		 'Parameter', 1,
sub
#line 196 "drawparser.yp"
{ return [ $_[1] ] }
	],
	[#Rule 51
		 'Parameter', 1,
sub
#line 197 "drawparser.yp"
{ return [ $_[1] ] }
	],
	[#Rule 52
		 'Parameter', 1,
sub
#line 198 "drawparser.yp"
{ return [ $_[1] ] }
	],
	[#Rule 53
		 'Parameter', 3,
sub
#line 199 "drawparser.yp"
{ return [ { $_[1] => [ { type => 'VAR', transit => $_[3], required => '1' } ] } ] }
	],
	[#Rule 54
		 'Parameter', 5,
sub
#line 200 "drawparser.yp"
{ return [ { $_[1] => [ { type => 'VAR', transit => $_[3], required => $_[5] } ] } ] }
	],
	[#Rule 55
		 'SpecialType', 4,
sub
#line 203 "drawparser.yp"
{
					my $list;
					$list->[0] = { type => 'SPECIAL' };
					$list->[1] = { args => $_[3] };
					return { $_[1] => $list }
			  }
	],
	[#Rule 56
		 'FunctionCall', 5,
sub
#line 211 "drawparser.yp"
{
						my $list;
						$list->[0] = { type => 'FUNCTION' };
						$list->[1] = { return => $_[2] };
						$list->[2] = { args => $_[5] };
						return { $_[4] => $list }
			   }
	],
	[#Rule 57
		 'FunctionCall', 2,
sub
#line 218 "drawparser.yp"
{
			            my $list;
						$list->[0] = { type => 'FUNCTION' };
						$list->[1] = { return => [] };
						$list->[2] = { args => $_[2] };
						return { $_[1] => $list }
			   }
	],
	[#Rule 58
		 'FuncArgs', 1,
sub
#line 227 "drawparser.yp"
{ return [ $_[1] ] }
	],
	[#Rule 59
		 'FuncArgs', 3,
sub
#line 228 "drawparser.yp"
{
   	   				push @{$_[1]},$_[3];
   					return $_[1]
   	       }
	],
	[#Rule 60
		 'NameArg', 2,
sub
#line 234 "drawparser.yp"
{ return [] }
	],
	[#Rule 61
		 'NameArg', 3,
sub
#line 235 "drawparser.yp"
{ return $_[2] }
	],
	[#Rule 62
		 'MethodCall', 1,
sub
#line 238 "drawparser.yp"
{ return $_[1] }
	],
	[#Rule 63
		 'PerlMethod', 4,
sub
#line 241 "drawparser.yp"
{
						my $list;
						$list->[0] = { type => 'METHOD' };
						$list->[1] = { method => $_[3] };
						$list->[2] = { args => [] };
						return { $_[1] => $list }
             }
	],
	[#Rule 64
		 'PerlMethod', 5,
sub
#line 248 "drawparser.yp"
{
						my $list;
						$list->[0] = { type => 'METHOD' };
						$list->[1] = { method => $_[3] };
						$list->[2] = { args => $_[4] };
						return { $_[1] => $list }
             }
	],
	[#Rule 65
		 'PerlMethod', 6,
sub
#line 255 "drawparser.yp"
{
		       			my $list;
	  	      			$list->[0] = { type => 'METHOD' };
	  	   			    $list->[1] = { method => $_[3].$_[4].$_[5] };
   		   			  	$list->[2] = { args => [] };
   		   			   	return { $_[1] => $list }
             }
	],
	[#Rule 66
		 'PerlMethod', 9,
sub
#line 262 "drawparser.yp"
{
		   				my $list;
		   		   		$list->[0] = { type => 'METHOD' };
	   		   			$list->[1] = { method => $_[3].$_[4].$_[5].$_[6].$_[7].$_[8] };
	   	   				$list->[2] = { args => [] };
       					return { $_[1] => $list }
		     }
	],
	[#Rule 67
		 'PerlMethod', 7,
sub
#line 269 "drawparser.yp"
{
		      			my $list;
		      			$list->[0] = { type => 'METHOD' };
		   			    $list->[1] = { method => $_[3].$_[4].$_[5] };
		   			  	$list->[2] = { args => $_[6] };
		   			   	return { $_[1] => $list }
	         }
	],
	[#Rule 68
		 'PerlMethod', 10,
sub
#line 276 "drawparser.yp"
{
	  					my $list;
	   			   		$list->[0] = { type => 'METHOD' };
	   		   			$list->[1] = { method => $_[3].$_[4].$_[5].$_[6].$_[7].$_[8] };
   		   				$list->[2] = { args => $_[9] };
						return { $_[1] => $list }
		     }
	],
	[#Rule 69
		 'OrgNode', 1,
sub
#line 285 "drawparser.yp"
{ return $_[1] }
	],
	[#Rule 70
		 'DstNode', 1,
sub
#line 288 "drawparser.yp"
{ return $_[1] }
	],
	[#Rule 71
		 'Type', 1,
sub
#line 291 "drawparser.yp"
{ return uc($_[1]) }
	],
	[#Rule 72
		 'Name', 1,
sub
#line 294 "drawparser.yp"
{ return $_[1] }
	]
],
                                  @_);
    bless($self,$class);
}

#line 297 "drawparser.yp"



1;
