public class WeChatPay implements PayMethod {
    @Override
    public void pay(int amount) {
        System.out.println("微信支付"+amount);

    }

}
