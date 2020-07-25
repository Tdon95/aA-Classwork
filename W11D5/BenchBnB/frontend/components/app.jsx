// export default () => (
//     <div>
//         <Route path="/" component={NavBarContainer} />
//         <Route exact path="/" component={Home} />
//         <ProtectedRoute path="/chirps" component={ChirpIndexContainer} />
//         <AuthRoute path="/signup" component={SignupContainer} />
//     </div>
// );

import React from "react";
import { Route, Switch, Link } from 'react-router-dom';
import GreetingContainer from "./greeting/greeting_container";
import LogInFormContainer from './session_form/login_form_container';
import SignUpFormContainer from './session_form/signup_form_container';
import { AuthRoute, ProtectedRoute } from '../util/route_util';

const App = () => (
    <div>
        <header>
            <Link to="/" className="header-link">
                <h1>Bench BnB</h1>
            </Link>
            <GreetingContainer />
        </header>
        <Switch>
            <AuthRoute exact path="/login" component={LogInFormContainer} />
            <AuthRoute exact path="/signup" component={SignUpFormContainer} />
            
            <Route path="/login" component={LogInFormContainer} />
            <Route path="/signup" component={SignUpFormContainer} />
        </Switch>
    </div>
);

export default App;