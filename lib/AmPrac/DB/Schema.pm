package AmPrac::DB::Schema;
use strict;
use warnings;
use utf8;

use Teng::Schema::Declare;

base_row_class 'AmPrac::DB::Row';

table {
	name 'sessions';
	pk 'id';
	columns qw(
		id
		session_data
	);
};

table {
    name 'entry';
    pk 'entry_id';
    columns qw(
		entry_id
		body
	);
};
# table {
    # name 'member';
    # pk 'id';
    # columns qw(id name);
# };

1;
