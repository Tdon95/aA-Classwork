// import React from 'react';
// import { Link } from 'react-router-dom';

// const Greeting = ({ currentUser, logout }) => {
//     const links = () => (
//         <nav className="login-signup">
//             <Link to="/login">Login</Link>
//             <Link to="/signup">Sign up!</Link>
//         </nav>
//     );

//     const greet = () => (
//         <hgroup className="header-group">
//             <h2 className="header-name">Hello {currentUser.username}</h2>
//             <button className="header-button" onClick={logout}>Log Out</button>
//         </hgroup>
//     );
    
//     return currentUser ? greet() : links();
// }

// export default Greeting;

import React from 'react';
import { Link } from 'react-router-dom'

class Greeting extends React.Component {
    constructor(props) {
        super(props)
    }
    render() {
        let status;
        if (this.props.currentUser) {
            status = (
                <div>
                    <p>Welcome {this.props.currentUser.username}</p>
                    <button onClick={this.props.logout}>Log out</button>
                </div>
            );
        } else {
            status = (
                <div>
                    <Link to="/signup">Sign up</Link>
                    <Link to="/login">Log in</Link>
                </div>
            );
        }
        return (
            <div>
                {status}
            </div>
        )
    }
}
export default Greeting;