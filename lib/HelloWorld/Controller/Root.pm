package HelloWorld::Controller::Root;

use strict;
use warnings;
use parent 'Catalyst::Controller';

#
# Sets the actions in this controller to be registered with no prefix
# so they function identically to actions created in MyApp.pm
#
__PACKAGE__->config->{namespace} = '';

sub hello :Path :Args(0) {
    my ( $self, $c ) = @_;
    $c->response->body( 'Hello World' );
}

sub start :Path('start') :Args(0) {
    DB::enable_profile();
}

sub stop :Path('stop') :Args(0) {
    DB::disable_profile();
    DB::finish_profile();
    exit;
}

sub end : ActionClass('RenderView') {}

1;
