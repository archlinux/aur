package Tie::StdScalar;
@ISA = qw(Tie::Scalar);

sub TIESCALAR {
    my $class = shift;
    my $instance = shift || undef;
    return bless \$instance => $class;
}

sub FETCH {
    return ${$_[0]};
}

sub STORE {
    ${$_[0]} = $_[1];
}

sub DESTROY {
    undef ${$_[0]};
}

1;

