export const signup = user => (
    $.ajax({
        method: "POST",
        url: "/api/users",
        data: { user }
    })
)


export const login = user => {
    return $.ajax({
        url: '/api/session',
        method: 'POST',
        data: { user }
    })
}


export const logout = () => {
    return $.ajax({
        url: '/api/session',
        method: "DELETE"
    })
}