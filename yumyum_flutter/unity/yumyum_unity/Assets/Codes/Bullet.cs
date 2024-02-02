using System.Collections;
using UnityEngine;

public class Bullet : MonoBehaviour
{
    public float speed = 5f; // Adjust the speed as needed

    private Vector2 targetPos;
    public float rotationSpeed = 200f;
    // Set the target position of the bullet when called from the Hero script
    public void SetTargetPosition(Vector2 newTargetPos)
    {
        targetPos = newTargetPos;
    }

    private void Start()
    {
        Destroy(this.gameObject, 1);
    }
    // Update is called once per frame
    void Update()
    {
        Vector2 direction = targetPos - (Vector2)transform.position;
        direction.Normalize();

        // 타겟을 향해 회전
        float rotateAmount = Vector3.Cross(direction, transform.up).z;
        GetComponent<Rigidbody2D>().angularVelocity = -rotateAmount * rotationSpeed;

        // 직진 이동
        GetComponent<Rigidbody2D>().velocity = transform.up * speed;
    }

    void MoveBullet()
    {
        // Calculate the direction from the current position to the target position
        Vector2 direction = (targetPos - (Vector2)transform.position).normalized;

        // Move the bullet in the calculated direction
        transform.Translate(direction * speed * Time.deltaTime);

        // Rotate the bullet to face the movement direction
        float angle = Mathf.Atan2(direction.y, direction.x) * Mathf.Rad2Deg;
        transform.rotation = Quaternion.Euler(new Vector3(0, 0, angle));

        // Destroy the bullet if it goes off-screen or after a certain time
        if (!GetComponent<Renderer>().isVisible)
        {
            Destroy(gameObject);
        }
    }

    // You can add other logic here, such as handling collisions with enemies
    // or any other specific behavior for the bullet.
}
