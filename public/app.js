

function logout() {
	const csrfFromMeta = document.querySelector('meta[name="csrf-token"]').getAttribute('content')

	const urlLogout = 'http://localhost:8080/logout'
	fetch(urlLogout, {
		credentials: 'same-origin',
		method: 'POST',
		headers: {
			'CSRF-Token': csrfFromMeta
		}
	})
	location.reload()
}
