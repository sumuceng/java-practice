public class Main {

    public static void main(String[] args) {

        System.out.println("=== 支付系统：面向接口编程 ===");
        Order order1 = new Order(new Alipay());
        order1.checkout(100);
        Order order2 = new Order(new WeChatPay());
        order2.checkout(200);

        System.out.println();
        System.out.println("=== MyList：手写 ArrayList 扩容 ===");
        MyList list = new MyList();
        list.add("a");
        list.add("b");
        list.add("c");
        list.add("d");   // 触发扩容：3 -> 6
        list.add("e");

        System.out.println("size = " + list.size());
        for (int i = 0; i < list.size(); i++) {
            System.out.println(list.get(i));
        }
    }
}
