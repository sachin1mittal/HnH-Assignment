import React from 'react';
import {
  Switch,
  Route,
} from "react-router-dom";
import StudentDetails from './components/studentDetails';
import Students from './components/students';

function Routes() {
  return (
    <Switch>
      <Route exact path="/">
        <Students />
      </Route>
      <Route
        path="/students/:id"
        exact
        component={StudentDetails}
       />
    </Switch>
  );
}

export default Routes;
