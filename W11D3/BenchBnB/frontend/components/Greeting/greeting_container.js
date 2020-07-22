import React from 'react';
import { connect } from 'react-redux';
import Greeting from './greeting';


const msp = (state) => {
    greetings: Object.keys(state.entities.greetings).map(key => state.entities.greetings[key])
}

const mdp = (dispatch) => ({
    greetings: ()=> dispatch()
})

export default connect(msp, mdp)(Greeting);

// noooooooooooooooooooooooooooooooooooooooo