# java-practice

Java 后端学习练习项目。记录从零开始的练习代码。

## 代码说明

| 文件 | 内容 | 涉及知识点 |
|---|---|---|
| `PayMethod.java` | 支付接口 | 接口定义 |
| `Alipay.java` / `WeChatPay.java` | 两种支付实现 | 接口实现、`@Override` |
| `Order.java` | 订单类，通过接口调用支付 | 面向接口编程、依赖注入 |
| `BusinessException.java` | 自定义业务异常 | 异常继承、`super(message)` |
| `UserService.java` | 用户注册 + 用户名/密码校验 | 卫语句、`throw`、集合操作 |
| `Main.java` | 统一测试入口 | — |
| `txt.txt` | 文件读取练习的测试数据 | — |

## 核心设计

`Order` 只依赖 `PayMethod` 接口，不依赖具体实现：

```java
public class Order {
    private PayMethod payMethod;

    public Order(PayMethod payMethod) {
        this.payMethod = payMethod;
    }

    public void checkout(int amount) {
        payMethod.pay(amount);
    }
}
```

新增一种支付方式（如 `BankCard`）时，`Order` 无需修改。

## 环境

- JDK 17
- IntelliJ IDEA 2025.1.3

## 运行

每个类的 `main` 方法可独立运行，统一入口在 `Main.java`。
