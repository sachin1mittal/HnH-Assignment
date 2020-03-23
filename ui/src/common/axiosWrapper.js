import axios from 'axios';
import _ from 'lodash';
import { apiUrl } from '../constants';

const acceptHeaders = {
  Accept: 'application/json',
  'Content-Type': 'application/json',
};

const fetchData = async (url, method) => {
  const axiosConfig = {
    url: `${apiUrl}${url}`,
    method: method,
    headers: acceptHeaders,
  };

  try {
    const response = await axios(axiosConfig);
    return response;
  } catch (err) { return err }
};

export async function doGet(url) {
  const response = await fetchData(url, 'get').then(response =>
    _.includes([204, 304], response.status) ? {} : response
  );

  if(response.status >= 200 && response.status < 400) {
    return response.data;
  }
}

export default {
  doGet,
}
