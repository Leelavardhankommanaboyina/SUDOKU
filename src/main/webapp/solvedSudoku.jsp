<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <title>Solved Sudoku</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #283048, #859398);
            color: #ffffff;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            margin: 0;
            padding: 20px;
        }

        h1 {
            font-size: 3em;
            margin-bottom: 20px;
            color: #f1c40f;
            text-shadow: 2px 2px 8px rgba(0, 0, 0, 0.7);
        }

        h2 {
            color: #2ecc71;
            margin-bottom: 20px;
            text-transform: uppercase;
            letter-spacing: 2px;
        }

        table {
            border-collapse: collapse;
            background: #ecf0f1;
            border-radius: 10px;
            margin: 20px 0;
            box-shadow: 0px 4px 20px rgba(0, 0, 0, 0.1);
        }

        td {
            border: 2px solid #34495e;
            width: 60px;
            height: 60px;
            font-size: 1.4em;
            font-weight: bold;
            text-align: center;
            vertical-align: middle;
            color: #34495e;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        /* Highlight cells on hover */
        td:hover {
            transform: scale(1.1);
            box-shadow: 0 0 20px rgba(46, 204, 113, 0.8);
            border-color: #2ecc71;
        }

        /* Enhanced 3x3 grid lines */
        td:nth-child(3n+1) {
            border-left-width: 3px;
        }
        tr:nth-child(3n+1) td {
            border-top-width: 3px;
        }

        .board {
            animation: pulse 3s infinite;
        }

        @keyframes pulse {
            0% { box-shadow: 0px 0px 20px rgba(255, 255, 255, 0.2); }
            50% { box-shadow: 0px 0px 40px rgba(255, 255, 255, 0.5); }
            100% { box-shadow: 0px 0px 20px rgba(255, 255, 255, 0.2); }
        }

        .steps {
            max-width: 800px;
            margin-top: 30px;
            color: #16a085;
            background-color: rgba(255, 255, 255, 0.2);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.3);
        }

        .step-title {
            font-size: 1.5em;
            color: #f39c12;
            margin-bottom: 10px;
        }

        .status {
            padding: 15px 25px;
            border-radius: 5px;
            font-size: 1.4em;
            text-align: center;
            margin-top: 30px;
            background: #27ae60;
            box-shadow: 0 0 20px rgba(39, 174, 96, 0.5);
            transition: background 0.5s ease;
        }

        .status.unsolved {
            background: #e74c3c;
            box-shadow: 0 0 20px rgba(231, 76, 60, 0.5);
        }

    </style>
</head>
<body>
    <h1>Sudoku Puzzle</h1>

    <% 
        // Retrieve boards and steps from request
        char[][] initialBoard = (char[][]) request.getAttribute("initialBoard");
        char[][] finalBoard = (char[][]) request.getAttribute("finalBoard");
        List<char[][]> steps = (List<char[][]>) request.getAttribute("steps");
        boolean solved = (boolean) request.getAttribute("solved");
    %>

    <h2>Original Board</h2>
    <table class="board">
        <% 
            for (int i = 0; i < 9; i++) {
                out.print("<tr>");
                for (int j = 0; j < 9; j++) {
                    out.print("<td>" + (initialBoard[i][j] == '.' ? "&nbsp;" : initialBoard[i][j]) + "</td>");
                }
                out.print("</tr>");
            }
        %>
    </table>

    <h2>Solved Board</h2>
    <table class="board">
        <% 
            for (int i = 0; i < 9; i++) {
                out.print("<tr>");
                for (int j = 0; j < 9; j++) {
                    out.print("<td>" + (finalBoard[i][j] == '.' ? "&nbsp;" : finalBoard[i][j]) + "</td>");
                }
                out.print("</tr>");
            }
        %>
    </table>

    <h2>Solving Steps</h2>
    <div class="steps">
        <% 
            if (steps != null && !steps.isEmpty()) {
                int stepNumber = 1;
                for (char[][] step : steps) {
        %>
        <div class="step">
            <div class="step-title">Step <%= stepNumber++ %></div>
            <table>
                <% 
                    for (int i = 0; i < 9; i++) {
                        out.print("<tr>");
                        for (int j = 0; j < 9; j++) {
                            out.print("<td>" + (step[i][j] == '.' ? "&nbsp;" : step[i][j]) + "</td>");
                        }
                        out.print("</tr>");
                    }
                %>
            </table>
        </div>
        <% 
                }
            } else {
        %>
        <p>No solving steps available!</p>
        <% 
            }
        %>
    </div>

    <div class="status <%= solved ? "" : "unsolved" %>">
        <%= solved ? "Congratulations! Sudoku solved successfully." : "Unable to solve the Sudoku puzzle." %>
    </div>
</body>
</html>
