/**

 *Submitted for verification at Etherscan.io on 2020-12-20

*/



//CYCR

//supply - 16000000000000000000000

//decimals -18



//pragma solidity ^0.5.17;
pragma solidity >=0.5 <0.7.17;









interface IERC20 {

    

    function totalSupply() external view returns (uint256);



    

    function balanceOf(address account) external view returns (uint256);



    

    function transfer(address recipient, uint256 amount) external returns (bool);



    

    function allowance(address owner, address spender) external view returns (uint256);



    

    function approve(address spender, uint256 amount) external returns (bool);



    

    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);



    

    event Transfer(address indexed from, address indexed to, uint256 value);



   

    event Approval(address indexed owner, address indexed spender, uint256 value);

}









contract Context {

    

    constructor () internal { }

   



    function _msgSender() internal view returns (address payable) {

        return msg.sender;

    }



    function _msgData() internal view returns (bytes memory) {

        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691

        return msg.data;

    }

}





library SafeMath {

    /**

     * @dev Returns the addition of two unsigned integers, reverting on

     * overflow.

     *

     * Counterpart to Solidity's `+` operator.

     *

     * Requirements:

     * - Addition cannot overflow.

     */

    function add(uint256 a, uint256 b) internal pure returns (uint256) {

        uint256 c = a + b;

        require(c >= a, "SafeMath: addition overflow");



        return c;

    }



    /**

     * @dev Returns the subtraction of two unsigned integers, reverting on

     * overflow (when the result is negative).

     *

     * Counterpart to Solidity's `-` operator.

     *

     * Requirements:

     * - Subtraction cannot overflow.

     */

    function sub(uint256 a, uint256 b) internal pure returns (uint256) {

        return sub(a, b, "SafeMath: subtraction overflow");

    }



    /**

     * @dev Returns the subtraction of two unsigned integers, reverting with custom message on

     * overflow (when the result is negative).

     *

     * Counterpart to Solidity's `-` operator.

     *

     * Requirements:

     * - Subtraction cannot overflow.

     *

     * NOTE: This is a feature of the next version of OpenZeppelin Contracts.

     * @dev Get it via `npm install @openzeppelin/[email protected]`.

     */

    function sub(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {

        require(b <= a, errorMessage);

        uint256 c = a - b;



        return c;

    }



    /**

     * @dev Returns the multiplication of two unsigned integers, reverting on

     * overflow.

     *

     * Counterpart to Solidity's `*` operator.

     *

     * Requirements:

     * - Multiplication cannot overflow.

     */

    function mul(uint256 a, uint256 b) internal pure returns (uint256) {

        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the

        // benefit is lost if 'b' is also tested.

        // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522

        if (a == 0) {

            return 0;

        }



        uint256 c = a * b;

        require(c / a == b, "SafeMath: multiplication overflow");



        return c;

    }



    /**

     * @dev Returns the integer division of two unsigned integers. Reverts on

     * division by zero. The result is rounded towards zero.

     *

     * Counterpart to Solidity's `/` operator. Note: this function uses a

     * `revert` opcode (which leaves remaining gas untouched) while Solidity

     * uses an invalid opcode to revert (consuming all remaining gas).

     *

     * Requirements:

     * - The divisor cannot be zero.

     */

    function div(uint256 a, uint256 b) internal pure returns (uint256) {

        return div(a, b, "SafeMath: division by zero");

    }



    /**

     * @dev Returns the integer division of two unsigned integers. Reverts with custom message on

     * division by zero. The result is rounded towards zero.

     *

     * Counterpart to Solidity's `/` operator. Note: this function uses a

     * `revert` opcode (which leaves remaining gas untouched) while Solidity

     * uses an invalid opcode to revert (consuming all remaining gas).

     *

     * Requirements:

     * - The divisor cannot be zero.

     * NOTE: This is a feature of the next version of OpenZeppelin Contracts.

     * @dev Get it via `npm install @openzeppelin/[email protected]`.

     */

    function div(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {

        // Solidity only automatically asserts when dividing by 0

        require(b > 0, errorMessage);

        uint256 c = a / b;

        // assert(a == b * c + a % b); // There is no case in which this doesn't hold



        return c;

    }



    /**

     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),

     * Reverts when dividing by zero.

     *

     * Counterpart to Solidity's `%` operator. This function uses a `revert`

     * opcode (which leaves remaining gas untouched) while Solidity uses an

     * invalid opcode to revert (consuming all remaining gas).

     *

     * Requirements:

     * - The divisor cannot be zero.

     */

    function mod(uint256 a, uint256 b) internal pure returns (uint256) {

        return mod(a, b, "SafeMath: modulo by zero");

    }



    /**

     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),

     * Reverts with custom message when dividing by zero.

     *

     * Counterpart to Solidity's `%` operator. This function uses a `revert`

     * opcode (which leaves remaining gas untouched) while Solidity uses an

     * invalid opcode to revert (consuming all remaining gas).

     *

     * Requirements:

     * - The divisor cannot be zero.

     *

     * NOTE: This is a feature of the next version of OpenZeppelin Contracts.

     * @dev Get it via `npm install @openzeppelin/[email protected]`.

     */

    function mod(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {

        require(b != 0, errorMessage);

        return a % b;

    }

}











contract ERC20 is IERC20, Context {

    using SafeMath for uint256;



    mapping (address => uint256) private _balances;



    mapping (address => mapping (address => uint256)) private _allowances;



    uint256 private _totalSupply;

    

    string private _name;

    string private _symbol;

    uint8 private _decimals;



   

    constructor (address creator, string memory name, string memory symbol, uint256 supply, uint8 decimals) public {

        _name = name;

        _symbol = symbol;

        _mint(creator, supply);

        _decimals = decimals;

    }



    

    function name() public view returns (string memory) {

        return _name;

    }



    

    function symbol() public view returns (string memory) {

        return _symbol;

    }



    

    function decimals() public view returns (uint8) {

        return _decimals;

    }



    

    function totalSupply() public view returns (uint256) {

        return _totalSupply;

    }



   

    function balanceOf(address account) public view returns (uint256) {

        return _balances[account];

    }



    

    function transfer(address recipient, uint256 amount) public returns (bool) {

        _transfer(_msgSender(), recipient, amount);

        return true;

    }



    

    function allowance(address owner, address spender) public view returns (uint256) {

        return _allowances[owner][spender];

    }



    

    function approve(address spender, uint256 amount) public returns (bool) {

        _approve(_msgSender(), spender, amount);

        return true;

    }



   

    function transferFrom(address sender, address recipient, uint256 amount) public returns (bool) {

        _transfer(sender, recipient, amount);

        _approve(sender, _msgSender(), _allowances[sender][_msgSender()].sub(amount, "ERC20: transfer amount exceeds allowance"));

        return true;

    }



    

    function increaseAllowance(address spender, uint256 addedValue) public returns (bool) {

        _approve(_msgSender(), spender, _allowances[_msgSender()][spender].add(addedValue));

        return true;

    }



   

    function decreaseAllowance(address spender, uint256 subtractedValue) public returns (bool) {

        _approve(_msgSender(), spender, _allowances[_msgSender()][spender].sub(subtractedValue, "ERC20: decreased allowance below zero"));

        return true;

    }



    

    function _transfer(address sender, address recipient, uint256 amount) internal {

        require(sender != address(0), "ERC20: transfer from the zero address");

        require(recipient != address(0), "ERC20: transfer to the zero address");



        _balances[sender] = _balances[sender].sub(amount, "ERC20: transfer amount exceeds balance");

        _balances[recipient] = _balances[recipient].add(amount);

        emit Transfer(sender, recipient, amount);

    }



    

    function _mint(address account, uint256 amount) internal {

        require(account != address(0), "ERC20: mint to the zero address");



        _totalSupply = _totalSupply.add(amount);

        _balances[account] = _balances[account].add(amount);

        emit Transfer(address(0), account, amount);

    }



   

    function _burn(address account, uint256 amount) internal {

        require(account != address(0), "ERC20: burn from the zero address");



        _balances[account] = _balances[account].sub(amount, "ERC20: burn amount exceeds balance");

        _totalSupply = _totalSupply.sub(amount);

        emit Transfer(account, address(0), amount);

    }



    

    function _approve(address owner, address spender, uint256 amount) internal {

        require(owner != address(0), "ERC20: approve from the zero address");

        require(spender != address(0), "ERC20: approve to the zero address");



        _allowances[owner][spender] = amount;

        emit Approval(owner, spender, amount);

    }



    

    function _burnFrom(address account, uint256 amount) internal {

        _burn(account, amount);

        _approve(account, _msgSender(), _allowances[account][_msgSender()].sub(amount, "ERC20: burn amount exceeds allowance"));

    }

}
