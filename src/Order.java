

public class Order {  private  PayMethod payMethod;


    public Order(PayMethod payMethod) {
        this.payMethod = payMethod;
    }
     public void checkout(int amount){
        payMethod.pay(amount);

     }
}








