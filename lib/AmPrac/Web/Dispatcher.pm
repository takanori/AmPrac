package AmPrac::Web::Dispatcher;
use strict;
use warnings;
use utf8;
use Amon2::Web::Dispatcher::Lite;

any '/' => sub {
    my ($c) = @_;

	my @entries = $c->db->search('entry', { }, {
			order_by => {'entry_id' => 'DESC'},
			limit => 10,
		},
	);
	# my @entries = @{$c->db->selectall_arrayref(
		# q{SELECT * FROM entry ORDER BY entry_id DESC LIMIT 10},
		# {Slice => {}}
	# )};
	return $c->render(
		'index.tt' => {
			entries => \@entries,
		}
	);
};

post '/post' => sub {
	my ($c) = @_;

	if (my $body = $c->req->param('body')) {
		$c->db->insert(entry => +{
				body => $body,
			});
	}
	return $c->redirect('/');
};

# any '/' => sub {
    # my ($c) = @_;
    # return $c->render('index.tt');
# };

# post '/account/logout' => sub {
    # my ($c) = @_;
    # $c->session->expire();
    # return $c->redirect('/');
# };

1;
