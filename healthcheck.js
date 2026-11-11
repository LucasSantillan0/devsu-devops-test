import http from 'http'

const PORT = process.env.PORT || 8000

http.get(`http://127.0.0.1:${PORT}/health/live`, r => process.exit(r.statusCode === 200 ? 0 : 1)).on("error", () => process.exit(1))