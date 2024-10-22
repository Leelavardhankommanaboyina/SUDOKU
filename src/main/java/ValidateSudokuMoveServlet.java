import java.io.IOException;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ValidateSudokuMoveServlet")
public class ValidateSudokuMoveServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
        char[][] sudokuGrid = new char[9][9];
        for (int i = 0; i < 9; i++) {
            for (int j = 0; j < 9; j++) {
                String cellValue = request.getParameter("cell" + i + "_" + j);
                sudokuGrid[i][j] = (cellValue == null || cellValue.isEmpty()) ? '.' : cellValue.charAt(0);  
            }
        }

       
        boolean isValidMove = good(sudokuGrid);

        
        if (isValidMove) {
            request.setAttribute("validationMessage", "Valid Move");
        } else {
            request.setAttribute("validationMessage", "Invalid Move");
        }

        
        request.getRequestDispatcher("playSudoku.jsp").forward(request, response);
    }

    
    public boolean good(char[][] board) {
        Map<Integer, HashSet<Character>> row = new HashMap<>();
        Map<Integer, HashSet<Character>> col = new HashMap<>();
        Map<Integer, HashSet<Character>> box = new HashMap<>();

        for (int i = 0; i < 9; i++) {
            row.put(i, new HashSet<>());
            col.put(i, new HashSet<>());
            box.put(i, new HashSet<>());
        }

        for (int i = 0; i < 9; i++) {
            for (int j = 0; j < 9; j++) {
                char curr = board[i][j];
                if (curr != '.') {  
                    int boxIndex = 3 * (i / 3) + (j / 3); 

                    if (row.get(i).contains(curr) || col.get(j).contains(curr) || box.get(boxIndex).contains(curr)) {
                        return false;  
                    }

                    
                    row.get(i).add(curr);
                    col.get(j).add(curr);
                    box.get(boxIndex).add(curr);
                }
            }
        }
        return true;  
    }
}
