import java.util.ArrayList;
import java.util.List;

public class UserService {

    private List<String> names = new ArrayList<>();

    public void register(String username, String password) {

        if (names.contains(username)) {
            throw new BusinessException("用户已存在");
        }

        if (password.length() < 6) {
            throw new BusinessException("密码不能少于6位");
        }

        names.add(username);
        System.out.println("注册成功：" + username);
    }
}