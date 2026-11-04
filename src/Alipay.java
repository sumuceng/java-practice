public class Alipay implements PayMethod {
    @Override
    public void pay(int amount) {

        System.out.println("支付宝支付"+amount);
    }
}
