import React, { Component } from 'react';
import { getStudents } from '../api/studentActions';
import { Link } from 'react-router-dom';

class Students extends Component {
  state = {
    students: []
  };

  async componentDidMount() {
    const students = await getStudents();
    this.setState({ students });
  }

  render() {
    const { students } = this.state;
    return (
      <div>
        <h3>Students List</h3>
        <table className="table table-hover">
          <thead>
            <tr>
              <th scope="col">Name</th>
              <th scope="col">Roll Number</th>
              <th scope="col">House</th>
              <th scope="col">Actions</th>
            </tr>
          </thead>
          <tbody>
            {
              students.map(student => (
                <tr key={student.id}>
                  <td>{student.name}</td>
                  <td>{student.roll_number}</td>
                  <td>{student.house}</td>
                  <td>
                    <Link to={`/students/${student.id}`} className="btn btn-primary">
                      Details
                    </Link>
                  </td>
                </tr>
              ))
            }
          </tbody>
        </table>
      </div>
    );
  }
}

export default Students;
