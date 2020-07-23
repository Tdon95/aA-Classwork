import React from 'react';

class SessionForm extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            username: "",
            password: "",
        }
        this.handleSubmit = this.handleSubmit.bind(this)
        this.handleInput = this.handleInput.bind(this)
    }
    handleInput(e) {
        const currInput = e.target.name
        return this.setState({ [currInput]: e.target.value })
    }
    handleSubmit(e) {
        e.preventDefault();
        const user = Object.assign({}, this.state);
        this.props.processForm(user);
    }
    formHeader() {
        const fType = this.props.formType === "login" ? "Login" : "Sign up";
        return (
            <form>
                <h2>{fType}</h2>
                <label>Username:
                    <input type="text" name="username" onChange={this.handleInput} value={this.state.username} />
                </label>
                <label>Password:
                    <input type="password" name="password" onChange={this.handleInput} value={this.state.password} />
                </label>
                <button onClick={this.handleSubmit}>{fType}</button>
            </form>
        )
    }
    errs() {
        return (
            <div>
                {this.props.errors}
            </div>
        )
    }
    render() {
        const errors = this.props.errors ? this.errs() : "";
        return (
            <div>
                {this.props.navLink}
                {this.formHeader()}
                {errors}
            </div>
        )
    }
}
export default SessionForm;