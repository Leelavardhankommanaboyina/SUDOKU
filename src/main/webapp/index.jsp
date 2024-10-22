<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sudoku Solver</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: radial-gradient(circle, #0f2027, #203a43, #2c5364);
            color: #fff;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }

        h1 {
            color: #e0eaff;
            margin-bottom: 20px;
            font-size: 2em;
        }

        .container {
            width: 100%;
            max-width: 600px;
            margin: 20px;
        }

        .board {
            background: #1b2838;
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0px 0px 20px rgba(255, 255, 255, 0.2);
            margin: 20px;
            position: relative;
        }

        .board::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            border: 2px solid transparent;
            border-radius: 15px;
            pointer-events: none;
            animation: glowingBorder 3s infinite;
        }

        @keyframes glowingBorder {
            0% {
                border-color: #f39c12;
                box-shadow: 0 0 15px #f39c12;
            }
            50% {
                border-color: #e74c3c;
                box-shadow: 0 0 25px #e74c3c;
            }
            100% {
                border-color: #3498db;
                box-shadow: 0 0 15px #3498db;
            }
        }

        table {
            border-collapse: collapse;
            width: 100%;
        }

        td {
            border: 2px solid #34495e;
            width: 50px;
            height: 50px;
            text-align: center;
            vertical-align: middle;
            background-color: #2c3e50;
            color: #fff;
            transition: background-color 0.3s ease, transform 0.3s ease, box-shadow 0.3s ease;
            position: relative;
        }

        td:hover {
            background-color: #34495e;
            transform: scale(1.1);
            box-shadow: 0 0 15px rgba(52, 152, 219, 0.5);
            z-index: 1;
        }

        input[type="text"] {
            width: 100%;
            height: 100%;
            border: none;
            background: transparent;
            color: #fff;
            text-align: center;
            font-size: 1.5em;
            transition: background-color 0.3s ease, transform 0.2s ease;
            outline: none;
        }

        input[type="text"]:focus {
            background-color: #16a085;
            transform: scale(1.1);
            box-shadow: 0 0 10px rgba(26, 188, 156, 0.5);
        }

        input[type="submit"] {
            background-color: #3498db;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 1.2em;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        input[type="submit"]:hover {
            background-color: #2980b9;
            transform: scale(1.05);
        }
    </style>
</head>
<body>
<h1>KK-SUDOKU </h1>
    
    <div class="container">
        <div class="board">
            <form action="SolveSudokuServlet" method="POST">
                <table border="1">
                    <%
                        for (int i = 0; i < 9; i++) {
                            out.print("<tr>");
                            for (int j = 0; j < 9; j++) {
                                out.print("<td><input type='text' name='cell" + i + "_" + j + "' maxlength='1' /></td>");
                            }
                            out.print("</tr>");
                        }
                    %>
                </table>
                <br/>
                <input type="submit" value="start">
            </form>
        </div>
    </div>
</body>
</html>
