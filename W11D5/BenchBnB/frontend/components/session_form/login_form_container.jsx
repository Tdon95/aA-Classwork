import { connect } from 'react-redux';
import React from 'react';
import { Link } from 'react-router-dom';
import { login } from '../../actions/session_actions';
import SessionForm from './session_form';

const msp = ( {errors} ) => {
    return {
        errors: errors.session,
        formType: 'login',
        navLink: <Link to="/signup">sign up</Link>
    }
};

const mdp = dispatch => {
    return {
        form: (user) => dispatch(login(user))
    }
};

export default connect(msp, mdp)(SessionForm);