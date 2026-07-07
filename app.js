// Initial Digital Products Mock Data
const DEFAULT_PRODUCTS = [
    {
        id: "prod-1",
        title: "كتاب الدليل الشامل للتجارة الرقمية",
        description: "تعلم أسرار وخطوات إطلاق مشروعك الرقمي الناجح من الصفر وتحقيق أرباح مستمرة.",
        price: "1500 دج",
        image: "https://images.unsplash.com/photo-1544716278-ca5e3f4abd8c?auto=format&fit=crop&w=600&q=80",
        downloadUrl: "https://example.com/downloads/digital-commerce-guide.pdf"
    },
    {
        id: "prod-2",
        title: "قالب صفحة هبوط احترافي (HTML/CSS)",
        description: "قالب صفحة هبوط عصري وسريع متوافق تماماً مع الهواتف الذكية لزيادة مبيعاتك.",
        price: "2500 دج",
        image: "https://images.unsplash.com/photo-1507238691740-187a5b1d37b8?auto=format&fit=crop&w=600&q=80",
        downloadUrl: "https://example.com/downloads/landing-page-template.zip"
    },
    {
        id: "prod-3",
        title: "دورة أساسيات تصميم واجهات المستخدم UI/UX",
        description: "سلسلة فيديوهات مسجلة تشرح لك تصميم واجهات وتجربة المستخدم خطوة بخطوة بالصوت والصورة.",
        price: "4500 دج",
        image: "https://images.unsplash.com/photo-1581291518655-9523c932dedf?auto=format&fit=crop&w=600&q=80",
        downloadUrl: "https://example.com/downloads/uiux-design-course.zip"
    }
];

// Database simulation using localStorage
const db = {
    getProducts: () => {
        let prods = localStorage.getItem("products");
        if (!prods) {
            localStorage.setItem("products", JSON.stringify(DEFAULT_PRODUCTS));
            return DEFAULT_PRODUCTS;
        }
        return JSON.parse(prods);
    },
    getOrders: () => {
        return JSON.parse(localStorage.getItem("orders")) || [];
    },
    saveOrders: (orders) => {
        localStorage.setItem("orders", JSON.stringify(orders));
    },
    addOrder: (order) => {
        const orders = db.getOrders();
        orders.unshift(order);
        db.saveOrders(orders);
    },
    updateOrderStatus: (orderId, status) => {
        const orders = db.getOrders();
        const updated = orders.map(o => o.id === orderId ? { ...o, status } : o);
        db.saveOrders(updated);
    },
    deleteOrder: (orderId) => {
        const orders = db.getOrders();
        const filtered = orders.filter(o => o.id !== orderId);
        db.saveOrders(filtered);
    }
};

// Global UI Helper Functions
function showToast(message, type = "success") {
    const toast = document.createElement("div");
    toast.className = `glass`;
    toast.style.position = "fixed";
    toast.style.bottom = "20px";
    toast.style.right = "20px";
    toast.style.padding = "1rem 2rem";
    toast.style.zIndex = "9999";
    toast.style.borderRight = `4px solid ${type === "success" ? "var(--success)" : "var(--danger)"}`;
    toast.style.fontSize = "0.95rem";
    toast.style.fontWeight = "600";
    toast.style.color = "var(--text-main)";
    toast.style.direction = "rtl";
    toast.textContent = message;

    document.body.appendChild(toast);
    setTimeout(() => {
        toast.style.opacity = "0";
        setTimeout(() => toast.remove(), 300);
    }, 4000);
}
