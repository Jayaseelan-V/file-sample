%dw 2.0
output application/json
var inputMsg = payload default []
---
(inputMsg groupBy ((item, index) -> item.DEPARTMENT_ID)) mapObject ((empInfo, departId, departIndex) -> (departId): (empInfo map(emp,empIndex) -> {
    employeeId : emp.EMPLOYEE_ID,
    employeeName: trim(emp.FIRST_NAME ++ " "++ (emp.LAST_NAME default "")),
    employeeMail: emp.EMAIL,
    employeePhone: emp.PHONE_NUMBER
})
)