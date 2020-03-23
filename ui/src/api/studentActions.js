import { doGet } from "../common/axiosWrapper";

export const getStudents = () => {
  return doGet('/students');
}

export const getStudent = (studentId) => {
  return doGet(`/students/${studentId}`);
}

export default {
  getStudents,
  getStudent,
};
