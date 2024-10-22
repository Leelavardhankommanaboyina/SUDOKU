import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SolveSudokuServlet")
public class SolveSudokuServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        char[][] board = new char[9][9];
        char[][] initialBoard = new char[9][9];
        char[][] givenBoard = new char[9][9];
        
        List<char[][]> steps = new ArrayList<>();

        // Populate the board from the form inputs
        for (int i = 0; i < 9; i++) {
            for (int j = 0; j < 9; j++) {
                String value = request.getParameter("cell" + i + "_" + j);
                char cellValue = (value == null || value.equals("")) ? '.' : value.charAt(0);
                board[i][j] = cellValue;
                initialBoard[i][j] = cellValue; 
                givenBoard[i][j]=cellValue; 
            }
        }
     
        for(int i=0;i<9;i++)
        {
        	for(int j=0;j<9;j++)
        	{
        		if(board[i][j]!='.'&&board[i][j]!=' ')
        		{
        			char c=board[i][j];
        		   boolean check=good(board );
        				if(!check)
        				{
        					 request.getRequestDispatcher("Invalid.jsp").forward(request, response);
        		                return; 
        				}
        		}
        	}
        }
        
        boolean solved = solve(board);

        
        char[][] finalBoard = new char[9][9];
        for (int i = 0; i < 9; i++) {
            for (int j = 0; j < 9; j++) {
                if (initialBoard[i][j] == '.'||initialBoard[i][j] == ' ') {
                    finalBoard[i][j] = board[i][j];
                    initialBoard[i][j] = board[i][j];
                    char[][] step = new char[9][9];
                    for (int kiran = 0; kiran < 9; kiran++) {
                        for (int kk = 0; kk < 9; kk++) {
                            step[kiran][kk] = initialBoard[kiran][kk];
                        }
                    }
                    steps.add(step);
                } else {
                    finalBoard[i][j] = initialBoard[i][j];
                }
            }
        }

        
        request.setAttribute("initialBoard", givenBoard);
        request.setAttribute("finalBoard", finalBoard);
        request.setAttribute("steps", steps);
        request.setAttribute("solved", solved);
        request.setAttribute("currentStepIndex", 0); 
        request.getRequestDispatcher("solvedSudoku.jsp").forward(request, response);
    }

    private boolean solve(char[][] board) {
        return solve(board, 0, 0);
    }

    private boolean solve(char[][] board, int row, int col) {
        if (row == 9) return true; 
        if (col == 9) return solve(board, row + 1, 0);
        if (board[row][col] != '.') return solve(board, row, col + 1);

        for (char c = '1'; c <= '9'; c++) {
            if (isValid(board, row, col, c)) {
                board[row][col] = c;
                if (solve(board, row, col + 1)) return true;
                board[row][col] = '.'; 
            }
        }
        return false;
    }

    private boolean isValid(char[][] board, int row, int col, char c) {
        for (int i = 0; i < 9; i++) {
            if (board[row][i] == c || board[i][col] == c ||
                board[3 * (row / 3) + i / 3][3 * (col / 3) + i % 3] == c) {
                return false;
            }
        }
        return true;
    }
    public boolean good(char[][] board) {
        Map<Integer,HashSet<Character>>row=new HashMap<>();
         Map<Integer,HashSet<Character>>col=new HashMap<>();
          Map<Integer,HashSet<Character>>box=new HashMap<>();
         for(int i=0;i<9;i++)
         {
            row.put(i,new HashSet<>());
            col.put(i,new HashSet<>());
            box.put(i,new HashSet<>());
         }
         for(int i=0;i<9;i++)
         {
            for(int j=0;j<9;j++)
            {
                if(board[i][j]!='.')
                {
                    if(row.get(i).contains(board[i][j])||col.get(j).contains(board[i][j])||box.get(3*(i/3)+(j/3)).contains(board[i][j]))
                    return false;
                    else
                    {
                        row.get(i).add(board[i][j]);
                        col.get(j).add(board[i][j]);
                        box.get(3*(i/3)+(j/3)).add(board[i][j]);
                    }
                }
            }
         }
         return true;

    }
}
