<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
    <head>       
         <link rel="stylesheet" href="css/GenericTable.css"><%-- More Table Styling  --%>
         <link rel="stylesheet" href="css/search.css"><%-- Styling search box--%>
        <%-- <link rel="stylesheet" href="css/remoteTable.css"><%-- Styling Table --%>
        <%-- <link rel="stylesheet" href="css/remote.css"><%-- Styling Content:Both Display and New User Form --%>
        <%-- <link rel="stylesheet" href="css/btnStyle.css"> <%-- Styling All Button: Save, Delete Reset, Cancel --%>
        
        <script src="js/GenericSearchFilter.js" type="text/javascript">  </script>

        <meta charset="UTF-8">
        <title>Main</title>

        <style>
            a
            {
                text-decoration: none;
                color: teal;
                font-family: arial;
                font-size: 11;
            }
            th 
            {
              cursor: pointer;
            }
            tr:nth-child(even) 
            {
              background-color: #f2f2f2
            }
            
        </style>
    </head>
    
    <body class="body1">

        <jsp:include page="ITMenuBar.jsp"></jsp:include>
           <br>
        
            <p> <a href="ContactsIn" >&nbsp;&nbsp;&nbsp;Create New User</a>:  &nbsp;&nbsp;&nbsp;   &nbsp;&nbsp;&nbsp;   &nbsp;&nbsp;&nbsp;   &nbsp;&nbsp;&nbsp;   &nbsp;&nbsp;&nbsp;   &nbsp;&nbsp;&nbsp;   &nbsp;&nbsp;&nbsp;   &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;   &nbsp;&nbsp;&nbsp;   &nbsp;&nbsp;&nbsp;   &nbsp;&nbsp;&nbsp;   &nbsp;&nbsp;&nbsp;   &nbsp;&nbsp;&nbsp;   &nbsp;&nbsp;&nbsp;   &nbsp;&nbsp;&nbsp;<b>Contact Details</b></p>

        <center><h3></h3></center>
        <p>  <input width='20' name="search" type="search" class="light-table-filter" data-table="order-table" placeholder="Search...." ></p>

        <p style="color: red;">${errorString}</p>

    <table border="1" cellpadding="5" cellspacing="1" class="order-table table" id="myTable">
        <caption></caption>
        <thead>
            <tr>
                <th onclick="sortTable(0)">Full Name</th>
                <th onclick="sortTable(1)">Ext/Telephone No</th>
                <th onclick="sortTable(2)">Cell</th>
                <th onclick="sortTable(3)">Email Address</th>
                <th onclick="sortTable(4)">Internal/External</th>
                <th onclick="sortTable(5)">Dep/Company</th>
                <th onclick="sortTable(6)">Group</th>
                <th onclick="sortTable(7)">Region</th>
                <th onclick="sortTable(8)">Notes</th>

            </tr>
        </thead>
        <c:forEach items="${contactsList}" var="Contacts" >

            <tr>
                <td>${Contacts.fullname}</td>
                <td><a href="contactsEdit?extno=${Contacts.extno}"> ${Contacts.extno}</a></td>
                <td>${Contacts.cell}</td>
                <td><a href="mailto:${Contacts.email}">${Contacts.email}</td>
                <td>${Contacts.interexter}</td>
                <td>${Contacts.dep}</td>
                <td>${Contacts.groups}</td>
                <td>${Contacts.region}</td>
                <td>${Contacts.notes}</td>

            </tr>
        </c:forEach>
    </table>

    <script>
            function sortTable(n)
            {
              var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
              table = document.getElementById("myTable");
              switching = true;
              //Set the sorting direction to ascending:
              dir = "asc"; 
              /*Make a loop that will continue until
              no switching has been done:*/
              while (switching) {
                //start by saying: no switching is done:
                switching = false;
                rows = table.rows;
                /*Loop through all table rows (except the
                first, which contains table headers):*/
                for (i = 1; i < (rows.length - 1); i++) {
                  //start by saying there should be no switching:
                  shouldSwitch = false;
                  /*Get the two elements you want to compare,
                  one from current row and one from the next:*/
                  x = rows[i].getElementsByTagName("TD")[n];
                  y = rows[i + 1].getElementsByTagName("TD")[n];
                  /*check if the two rows should switch place,
                  based on the direction, asc or desc:*/
                  if (dir == "asc") {
                    if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
                      //if so, mark as a switch and break the loop:
                      shouldSwitch= true;
                      break;
                    }
                  } else if (dir == "desc") {
                    if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
                      //if so, mark as a switch and break the loop:
                      shouldSwitch = true;
                      break;
                    }
                  }
                }
                if (shouldSwitch) {
                  /*If a switch has been marked, make the switch
                  and mark that a switch has been done:*/
                  rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                  switching = true;
                  //Each time a switch is done, increase this count by 1:
                  switchcount ++;      
                } else {
                  /*If no switching has been done AND the direction is "asc",
                  set the direction to "desc" and run the while loop again.*/
                  if (switchcount == 0 && dir == "asc") {
                    dir = "desc";
                    switching = true;
                  }
                }
              }
            }
    </script>

</body>
</html>