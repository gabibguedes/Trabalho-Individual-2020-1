import axios from 'axios'

const base = 'http://67.205.150.225:3000/api/v1'

const API = axios.create({
  baseURL: base
})

export default API
