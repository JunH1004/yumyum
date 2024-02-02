using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Bullet : MonoBehaviour
{
    public float speed = 5f; // Adjust the speed as needed

    private Vector2 direction;

    // Set the direction of the bullet when called from the Hero script
    public void SetDirection(Vector2 newDirection)
    {
        direction = newDirection.normalized;
    }

    // Update is called once per frame
    void Update()
    {
        MoveBullet();
    }

    void MoveBullet()
    {
        // Move the bullet in the calculated direction
        transform.Translate(direction * speed * Time.deltaTime);

        // Destroy the bullet if it goes off-screen or after a certain time
        if (!GetComponent<Renderer>().isVisible)
        {
            Destroy(gameObject);
        }
    }

    // You can add other logic here, such as handling collisions with enemies
    // or any other specific behavior for the bullet.
}
