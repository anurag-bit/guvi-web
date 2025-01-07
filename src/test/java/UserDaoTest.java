import com.techno4.viridi.dao.UserDao;
import com.techno4.viridi.entities.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static org.mockito.Mockito.*;
import static org.junit.jupiter.api.Assertions.*;

public class UserDaoTest {

    private UserDao userDao;
    private SessionFactory sessionFactory;
    private Session session;
    private Query query;

    @BeforeEach
    public void setUp() {
        // Mock the SessionFactory, Session, and Query
        sessionFactory = mock(SessionFactory.class);
        session = mock(Session.class);
        query = mock(Query.class);

        // Mock behavior
        when(sessionFactory.openSession()).thenReturn(session);
        when(session.createQuery(anyString())).thenReturn(query);

        // Initialize the UserDao with the mocked SessionFactory
        userDao = new UserDao(sessionFactory);
    }

    @Test
    public void testGetUserByPhoneAndPassword_success() {
        // Create a mock User object
        User mockUser = new User();
        mockUser.setUserPhone("1234567890");
        mockUser.setUserPassword("Mannat@123");

        // Mock the query result
        when(query.setParameter("e", "1234567890")).thenReturn(query);
        when(query.setParameter("p", "Mannat@123")).thenReturn(query);
        when(query.uniqueResult()).thenReturn(mockUser);

        // Call the method to test
        User result = userDao.getUserByPhoneAndPassword("1234567890", "password123");

        // Verify that the session, query, and result are used as expected
        assertNotNull(result);
        assertEquals("1234567890", result.getUserPhone());
        assertEquals("Mannat@123", result.getUserPassword());
    }

    @Test
    public void testGetUserByPhoneAndPassword_noUserFound() {
        // Mock the query result to be null (no user found)
        when(query.setParameter("e", "wrongPhone")).thenReturn(query);
        when(query.setParameter("p", "wrongPassword")).thenReturn(query);
        when(query.uniqueResult()).thenReturn(null);

        // Call the method to test
        User result = userDao.getUserByPhoneAndPassword("wrongPhone", "wrongPassword");

        // Verify that the result is null (no user found)
        assertNull(result);
    }

    @Test
    public void testGetUserByPhoneAndPassword_exception() {
        // Make the query throw an exception
        when(query.setParameter("e", "1234567890")).thenThrow(new RuntimeException("Query failed"));

        // Call the method to test
        User result = userDao.getUserByPhoneAndPassword("1234567890", "password123");

        // Verify that the result is null due to the exception
        assertNull(result);
    }
}
