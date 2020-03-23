import React, { Component } from 'react';
import { getStudent } from '../api/studentActions';
import { Link } from 'react-router-dom';

class StudentDetails extends Component {
  state = {
    name: '',
    roll_number: '',
    house: '',
    courses: {}
  };

  async componentDidMount() {
    const { name, roll_number, house, courses } = await getStudent(
      this.props.match.params.id
    );
    this.setState({ name, roll_number, house, courses });
  }

  render() {
    const { name, roll_number, house, courses } = this.state;
    return (
      <div>
        <h3>{name}</h3>
        <p>Roll Number: {roll_number}</p>
        <p>House: {house}</p>
        <hr />
        <p>Courses:</p>
        <table className="table table-hover">
          <thead>
            <tr>
              <th scope="col">Subject</th>
              <th scope="col">Teacher</th>
            </tr>
          </thead>
          <tbody>
            {
              Object.keys(courses).map(course => (
                <tr key={course}>
                  <td>{course}</td>
                  <td>{courses[course]}</td>
                </tr>
              ))
            }
          </tbody>
        </table>
      </div>
    );
  }
}

export default StudentDetails;
