
import com.techno4.viridi.dao.ProductDao;
import com.techno4.viridi.entities.Product;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.junit.Before;
import org.junit.Test;

import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.*;
import static org.mockito.Mockito.*;

public class ProductDaoTest {

    private SessionFactory sessionFactory;
    private Session session;
    private ProductDao productDao;

    @Before
    public void setUp() {
        // Create mock objects
        sessionFactory = mock(SessionFactory.class);
        session = mock(Session.class);

        // Set up the ProductDao with the mocked SessionFactory
        productDao = new ProductDao(sessionFactory);

        // Mock the behavior of the SessionFactory to return the mocked Session
        when(sessionFactory.openSession()).thenReturn(session);
    }

    @Test
    public void testSaveProduct() {
        Product product = new Product();
        product.setpName("Test Product");
        product.setpDesc("Test Description");
        product.setpPrice((int) 100.0);
        product.setpDiscount((int) 10.0);
        product.setpPhoto("test.jpg");

        // Mock the transaction
        Transaction transaction = mock(Transaction.class);
        when(session.beginTransaction()).thenReturn(transaction);

        // Call the method to test
        boolean result = productDao.saveProduct(product);

        // Verify interactions
        verify(session).save(product);
        verify(transaction).commit();
        verify(session).close();

        // Assert the result
        assertTrue(result);
    }

    @Test
    public void testGetAllProducts() {
        // Prepare mock data
        List<Product> mockProducts = new ArrayList<>();
        mockProducts.add(new Product());
        mockProducts.add(new Product());

        // Mock the query and its behavior
        Query<Product> query = mock(Query.class);
        when(session.createQuery("from Product")).thenReturn(query);
        when(query.list()).thenReturn(mockProducts);

        // Call the method to test
        List<Product> products = productDao.getAllProducts();

        // Verify interactions
        verify(session).createQuery("from Product");
        verify(query).list();
        verify(session).close();

        // Assert the result
        assertEquals(2, products.size());
    }

    @Test
    public void testGetAllProductsById() {
        int categoryId = 1;

        // Prepare mock data
        List<Product> mockProducts = new ArrayList<>();
        mockProducts.add(new Product());
        mockProducts.add(new Product());

        // Mock the query and its behavior
        Query<Product> query = mock(Query.class);
        when(session.createQuery("from Product as p where p.category.categoryId =: id")).thenReturn(query);
        when(query.setParameter("id", categoryId)).thenReturn(query);
        when(query.list()).thenReturn(mockProducts);

        // Call the method to test
        List<Product> products = productDao.getAllProductsById(categoryId);

        // Verify interactions
        verify(session).createQuery("from Product as p where p.category.categoryId =: id");
        verify(query).setParameter("id", categoryId);
        verify(query).list();
        verify(session).close();

        // Assert the result
        assertEquals(2, products.size());
    }
}