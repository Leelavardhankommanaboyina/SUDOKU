<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Invalid Input</title>
    <style>
        body {
            background-color: #e9ecef; /* Light grey background */
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            position: relative;
        }

        .container {
            text-align: center;
            background-color: #ffffff;
            padding: 40px 60px;
            border-radius: 12px;
            border: 2px solid #d9534f; /* Border color */
            box-shadow: 0px 6px 20px rgba(0, 0, 0, 0.1);
            position: relative;
            overflow: hidden;
        }

        .container::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            border: 2px solid #d9534f;
            border-radius: 12px;
            pointer-events: none;
            z-index: 0;
            box-sizing: border-box;
            transition: border-color 0.5s;
        }

        .container:hover::before {
            border-color: #007bff; /* Border color on hover */
        }

        h1 {
            font-size: 2.5rem;
            color: #d9534f;
            margin-bottom: 20px;
        }

        p {
            font-size: 1.1rem;
            color: #555;
            margin-bottom: 30px;
        }

        button {
            background-color: #007bff;
            color: #ffffff;
            padding: 12px 24px;
            border: none;
            border-radius: 6px;
            font-size: 1rem;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Input is Incorrect!</h1>
        <p>Please check the values in your Sudoku grid and try again.</p>
        <form action="index.jsp" method="get">
            <button type="submit">Go Back</button>
        </form>
    </div>
</body>
</html>
