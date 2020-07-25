import { connect } from 'react-redux';
import Greeting from './greeting';


// const msp = (state) => {
//     greetings: Object.keys(state.entities.greetings).map(key => state.entities.greetings[key])
// }

const msp = ({ session, entities: { users } }) => {
    return {
        currentUser: users[session.id]
    };
};

const mdp = (dispatch) => ({
    logout: ()=> dispatch(logout())
})

export default connect(msp, mdp)(Greeting);

