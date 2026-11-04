public class Main {
    public static void main(String[] args) {
        Order order1=new Order(new Alipay());
        Order order2=new Order(new WeChatPay());
        order2.checkout(100);
        order1.checkout(100);




    }
}
