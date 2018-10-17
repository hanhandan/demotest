#include <linux/module.h>
#include <linux/init.h> 
#include <linux/errno.h>

static int test_init(void)
{
    printk("test module init\n");
    return 0;
}

static void test_exit(void)
{
    printk("testmodule exit\n");
}

module_init(test_init);
module_exit(test_exit);
MODULE_AUTHOR("hanshaoyang");
MODULE_LICENSE("GPL");
MODULE_DESCRIPTION("My Test Module");
